#lang racket

(require "stream.rkt")
(require "ordered-set.rkt")
(require "total-order.rkt")

(define (scoreboard stream)
  (stream-generate
   (list stream (list(car (stream-car stream))) os-empty)
   (lambda (x) (stream-empty? (car x)))
   (lambda (x) (list (stream-cdr (car x)) (generate-stream-name (second x) (car (stream-car (car x)))) (put-new-score (third x) (stream-car (car x))))) 
   (lambda (x) (list (car (stream-car (car x)))
                     (second (stream-car (car x)))
                     (second (to-unhide (os-before (put-new-score (third x) (stream-car (car x))) (to-hide (list(car(stream-car (car x))) +inf.0))))) 
                     (second x)))))

(define (generate-stream-name lst name)
  (if (empty? lst) (list name)
      (if (member name lst) lst
          (sort (append lst (list name)) symbol<?)))) 

(define (put-new-score set pair)
  (define max-pair (os-before set (to-hide (list(car pair) +inf.0))))
  (if (symbol=? (car pair) (car (to-unhide max-pair)))
     (os-union (os-difference set (os-singleton max-pair))
               (os-singleton (to-hide (list (car pair) (+ (second pair) (second (to-unhide max-pair)))))))
     (os-union set (os-singleton (to-hide pair)))))
                         
   (stream->list(scoreboard(list->stream
     (list
       (list 'Lisa 100 100 'Lisa)
       (list 'Bob -50 -50 'Lisa)
       (list 'Mel 20 20 'Lisa)
       (list 'Lisa -90 10 'Mel)
       (list 'Mel -50 -30 'Lisa)))))
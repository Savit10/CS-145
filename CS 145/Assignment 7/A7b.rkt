#lang racket

(require "scratchandwin.rkt")
(provide collect-prize)

(define (collect-prize cardlist)
  (cond
    [(and (list? cardlist) (not (fraud? cardlist)) (equal? (length cardlist) (list-ref (scratch (car cardlist)) 1)) (check-cardlist? cardlist) (distinct? (scratch-cardlist cardlist))) 'prize]
    [else 'fraud]))

(define (fraud? cardlist)
  (cond
    [(empty? cardlist) #f]
    [(equal? 'fraud (scratch (car cardlist))) #t]
    [else (fraud? (cdr cardlist))]))

(define (check-cardlist? cardlist)
  (cond
    [(empty? cardlist) #f]
    [(empty? (cdr cardlist)) #t]
    [else (check-cardlist? (cdr cardlist))]))

(define (scratch-cardlist lst)
  (if (empty? lst) empty (cons (scratch (car lst)) (scratch-cardlist (cdr lst)))))

(define (distinct? cardlist)
  (cond 
  [(empty? cardlist) #f]
  [(empty? (cdr cardlist)) #t]
  [(not (member (car cardlist) (cdr cardlist))) (distinct? (cdr cardlist))]
  [else #f]))
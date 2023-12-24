#lang racket

(require "ordered-set.rkt")
(require "total-order.rkt")
(require "stream.rkt")

(define (count s)
  (stream-map s))

(define (stream-map s)
  (stream-generate (list s os-empty)
   (lambda (x) (stream-empty? (first x)))
   (lambda (x) (list (stream-cdr (first x)) (os-union (second x) (os-singleton (to-hide (first (max-tuple (stream-car (first x)) (second x))))) (add1 (second (max-tuple (stream-car (first x)) (second x)))))))
   (lambda (x) (max-tuple (stream-car (first x)) (second x)))))

(define (max-tuple n set)
  (to-unhide (os-before (os-union set (os-singleton (to-hide n 0))) (to-hide (add1 n) 0))))    

(stream->list (count (list->stream (list 3 7 9 7 3))))
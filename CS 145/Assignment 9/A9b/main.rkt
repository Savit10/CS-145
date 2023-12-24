#lang racket
(require "stream.rkt")
(require "total-order.rkt")
(require "ordered-set.rkt")

(define (count s)
  (stream-generate 
   (list s empty)
   (lambda (x) (stream-empty? (car x)))
   (lambda (x) (list (stream-cdr (car x)) (os-union (second x) (os-singleton (to-hide (first (max-count-pair (stream-car (car x)) (second x))) (+ 1(second (max-count-pair (stream-car (car x)) (second x)))))))))
   (lambda (x) (max-count-pair (stream-car (car x)) (second x)))))
 
(define (max-count-pair n s)
  (to-unhide (os-before (os-union s (os-singleton (to-hide n 0))) (to-hide (+ 1 n) 0))))
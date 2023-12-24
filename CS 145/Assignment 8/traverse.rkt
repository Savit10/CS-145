#lang racket

(require "btree.rkt")
(require "generate.rkt")
(provide traverse)

(define (traverse t)
  (generate
   (list empty (list t))
   (lambda(x) (empty? (second x)))
   (lambda(x)
     (cond
       ((empty? (first (second x))) (list (first x) (cdr (second x)))) 
       [(integer? (first (second x))) (list (cons (first (second x)) (first x)) (cdr (second x)))]
       [true (list (first x) (cons (bt-left (first (second x))) (cons (bt-dec (first (second x))) (cons (bt-right (first (second x))) (cdr (second x))))))]))
   (lambda(x) (reverse (first x)))))


(define b (make-bt (make-bt (make-bt (make-bt empty 123 empty) 12 empty) 3 empty) 4 (make-bt empty 11 (make-bt empty 9 (make-bt empty 8 empty)))))

(traverse b)


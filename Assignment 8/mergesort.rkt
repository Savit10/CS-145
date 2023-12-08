#lang racket

(require "generate.rkt")
(provide my-sort)

(define (my-sort lst T)
  (generate
   (list (reverse (map list lst)) '() 0 (length lst))
   (lambda(x) (and (empty? (first x)) (= 0 (fourth x))))
   (lambda(x) (cond
                [(empty? (first x))
                 (cond
                    [(= (length (second x)) 1) (list empty (car (second x)) (third x) 0)]
                    [(= (remainder (fourth x) 2) 0) (list (second x) empty 0 (quotient (fourth x) 2)) ]
                    [true (list (second x) empty 0 (add1 (quotient (fourth x) 2)))])]
                [(empty? (cdr (first x))) (list (cons (merge (car (first x)) empty T) (second x)) empty 0 (fourth x))]
                [true (list (cddr (first x)) (cons (merge (car (first x)) (cadr (first x)) T) (second x)) 0 (fourth x))]))
   (lambda(x) (second x))))

(define (merge a b T)
  (generate
   (list a b '())
   (lambda(x) (and (empty? (first x)) (empty? (second x))))
   (lambda(x) (cond
                ((empty? (first x)) (list empty (cdr (second x)) (cons  (car (second x)) (third x))))
                ((empty? (second x))(list (cdr (first x)) empty (cons (car (first x)) (third x) )))
                ((T (car (first x)) (car (second x))) (list (cdr (first x)) (second x) (cons (car (first x)) (third x) )))
                (true (list (first x) (cdr (second x)) (cons (car (second x)) (third x))))))
   (lambda(x) (reverse (third x)))))
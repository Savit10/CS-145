#lang racket
(require "generate.rkt")

(provide prime?)
(provide my-build-list)
(provide my-foldl)
(provide my-insert)
(provide my-insertion-sort)

(define (prime? n)
  (generate (list (floor (sqrt n)) n) 
            (lambda(x) (or (= n 1) (= n 0) (integer? (/ (second x) (first x)))))
            (lambda(x) (list (sub1 (first x)) (cadr x)))
            (lambda(x) (and (not (or (= n 1) (= n 0))) (= (first x) 1)))))

(define (my-build-list n f)
  (generate (list 0)
            (lambda (x) (= (first x) n))
            (lambda (x) (cons (add1 (first x)) (cons (f (first x)) (rest x))))
            (lambda (x) (reverse (rest x)))))

(define (my-foldl f z l)
  (generate (cons (length l) (cons z l))
            (lambda(x) (= 0 (car x)))
            (lambda(x) (cons (sub1 (car x)) (cons (f (caddr x) (cadr x)) (cdddr x))))
            (lambda(x) (second x))))

(define (my-insert e l T)
  (generate (list empty l)
            (lambda (x) (or (empty? (second x)) (T e (first (second x)))))
            (lambda (x) (list (cons (first (second x)) (first x)) (rest (second x))))
            (lambda (x) (append (reverse (first x)) (cons e (second x))))))

(define (my-insertion-sort l T)
  (generate (list (list(first l)) (rest l))
            (lambda (x) (empty? (second x)))
            (lambda (x) (list (my-insert (first (second x)) (first x) T) (rest (second x))))
            (lambda (x) (first x))))
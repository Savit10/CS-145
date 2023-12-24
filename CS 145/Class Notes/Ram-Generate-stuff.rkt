#lang racket
(require "RAM.rkt")

;; Gen behaves like Gen from A11, except
;;   -- it does not require lazy Racket
;;   -- inp is a list, not a stream
;;   -- result is a list, not a stream
;;   -- (step inp state cont) can access only 1st element of inp
;;   -- when step applies (cont newinp newstate newoutput) 
;;      - newinp must be either inp or (cdr inp)
;;      - newstate must be a RAM
;;
;; (accum s) uses Gen to compute the cumulative sum of a list
;;
;; Example:
;;  (accum (build-list 6 (lambda(x)(quotient x 2)))) ; '(0 0 1 1 3 3)

(define (Gen inp state step)
  (define inphead (if (empty? inp) empty (take inp 1)))
  (define inprest (if (empty? inp) empty (cdr inp)))
  (define (cont newinp state out)
     (if (or (eq? newinp inphead)(eq? newinp (cdr inphead)))
         (append out (Gen (append newinp inprest) state step))
         'fail))
  (step inphead state cont))

(define r1 (ram-store ram 22 1))
(define r2 (ram-store r1 55 0))
(define r3 (ram-store r2 99 0))

(core-dump r3)

(define (step inp r cont)
  (define a (ram-fetch r 22))
  (define b (ram-fetch r 55))
  (define c (ram-fetch r 99))
  (cond
    [(not (empty? inp))
     (define newb (car inp))
     (define r1 (ram-store r 55 newb))
     (cont (cdr inp) r1 empty)] 
    [(> a b) (list c)]
    [true
     (define newa (add1 a))
     (define newb b)
     (define newc (+ a c))
     (define r1 (ram-store r 22 newa))
     (define r2 (ram-store r1 99 newc))
     (cont inp r2 (list c))]))

(Gen (list 10) r3 step)
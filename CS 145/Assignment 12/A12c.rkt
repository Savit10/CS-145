#lang racket

(require "RAM.rkt")
(define (Gen inp state step)
  (define inphead (if (empty? inp) empty (take inp 1)))
  (define inprest (if (empty? inp) empty (cdr inp)))
  (define (cont newinp state out)
     (if (or (eq? newinp inphead)(eq? newinp (cdr inphead)))
         (append out (Gen (append newinp inprest) state step))
         'fail))
  (step inphead state cont))

(define (step inp state cont)
  (define acc (ram-fetch state 0))
  (define length (ram-fetch state 1))
  (define count (ram-fetch state 2))
  (define index-left
    (if (> length 2) (ram-store (ram-fetch state 3) (+ 2 state )
  (define 
    (cond
     [(empty? inp) empty]
     [(= 0 count) (cont (cdr inp) (ram-store (ram-store (ram-store (ram-store state (+ 3 length) (car inp)) 1 (+ 1 length)) 2 length) 0 (+ acc (car inp))) (list (+ acc (car inp))))]
     [(= (car inp) (ram-fetch state (+ 2 count))) (cont (cdr inp) (ram-store state 2 length) (list acc))]  
     [else (cont inp (ram-store state 2 (max (sub1 state-2) 0)) empty)]))

(define start (ram-store (ram-store (ram-store (ram-store ram 0 0) 1 0) 2 0) 3 0))

(Gen (list 1 2 1 2 3) start step)




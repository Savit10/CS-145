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
  (define state-0 (ram-fetch state 0))
  (define state-1 (ram-fetch state 1))
  (define state-2 (ram-fetch state 2))
    (cond
     [(empty? inp) empty]
     [(= (car inp) (ram-fetch state (+ 2 state-2))) (cont (cdr inp) (ram-store state 2 state-1) (list state-0))]  
     [(= 0 state-2) (cont (cdr inp) (ram-store (ram-store (ram-store (ram-store state (+ 3 state-1) (car inp)) 1 (+ 1 state-1)) 2 state-1) 0 (+ state-0 (car inp))) (list (+ state-0 (car inp))))]
     [else (cont inp (ram-store state 2 (max (sub1 state-2) 0)) empty)]))

(define start (ram-store (ram-store (ram-store ram 0 0) 1 0) 2 0))
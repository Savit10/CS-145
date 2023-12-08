#lang racket

(provide playgame)
(require "scratchandwin.rkt")

(define (playgame n) (playgame-help n empty empty))

(define (playgame-help n lst cardlist)
  (define card (drawcard n))
  (define scra (car (scratch card)))
  
  (cond
    [(= (length lst) n) cardlist]
    [(list? (member scra lst)) (playgame-help n lst cardlist)]
    [true (playgame-help n (cons scra lst) (cons card cardlist))]))
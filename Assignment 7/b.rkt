#lang racket

(provide playgame)
(require "scratchandwin.rkt")
(require "avl-cs145.rkt")
(define (playgame n) (playgame-helper n empty empty))

(define (playgame-helper n cardlist1 cardlist2)
  (define card (drawcard n)) 
  (cond
    [(= (length cardlist1) n) cardlist2]
    [(list? (member (car (scratch card)) cardlist1)) (playgame-helper n cardlist1 cardlist2)]
    [else (playgame-helper n (cons (car (scratch card)) cardlist1) (cons card cardlist2))]))
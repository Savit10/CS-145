#lang racket

(provide playgame)
(require "prize.rkt")
(require "scratchandwin.rkt")

(define (playgame n)
  (playgame-help empty n))

(define (playgame-help acc1 n)
  (cond
    [(equal? (length (set->list (list->set acc1))) n) (set->list (list->set acc1))]
    [else (playgame-help (cons (drawcard n) acc1) n)]))
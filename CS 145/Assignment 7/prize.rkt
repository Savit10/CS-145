#lang racket

(require "scratchandwin.rkt")
(provide collect-prize)

(define (collectprize-helper accumulator cardlist n)
  (cond
    [(empty? cardlist) (if (equal? (length accumulator) (length (set->list (list->set accumulator)))) 'prize 'fraud)]
    [(equal? (scratch (car cardlist)) 'fraud) 'fraud]
    [(not (= n (car (cdr (scratch (car cardlist)))))) 'fraud]
    [else (collectprize-helper (cons (car (scratch (car cardlist))) accumulator) (cdr cardlist) n)])) 

(define (collect-prize cardlist)
  (if (list? cardlist) (collectprize-helper empty cardlist (length cardlist)) 'fraud))
#lang racket

(provide playgame)
(require "scratchandwin.rkt")
(require "avl-cs145.rkt")

(define (playgame n)
  (playgame-helper n '() '() (drawcard n)))

(define (playgame-helper n t lst card)
  (cond
    [(= n (sizeavl t)) lst]
    [(not(tree-contain? t (car (scratch card)))) (playgame-helper n (insertavl t (car (scratch card))) (cons card lst) (drawcard n))]
    [else (playgame-helper n t lst (drawcard n))]))

(define (tree-contain? t elem)
  (cond
    ((empty? t) false)
    ((= (node-key t) elem) true)
    ((> (node-key t) elem) (tree-contain? (node-left t) elem))
    ((< (node-key t) elem) (tree-contain? (node-right t) elem))))
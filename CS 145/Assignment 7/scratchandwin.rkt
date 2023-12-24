#lang racket

(provide drawcard)
(provide scratch)

(define-struct card (secret n))

(define (drawcard n)
  (make-card (+ (random n) 1) n))

(define (scratch card)
  (if (not (card? card)) 'fraud (list (card-secret card) (card-n card))))

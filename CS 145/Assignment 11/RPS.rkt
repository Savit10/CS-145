#lang lazy

(require "Gen.rkt")
(require "IOStream.rkt")

(define (RPS Player1 Player2)
  (define A (Player1 (history B)))
  (define B (Player2 (history A)))
  (playgame A B))

(define (bart opponent-history)
  (define (mymove other) 'rock)
  (map mymove opponent-history))

(define (lisa opponent-history)
  (define (mymove other)
    (cond
      [(equal? (length other) 0) 'paper]
      [else 'rock]))
  (map mymove opponent-history))

(define (maggie opponent-history)
  (define (mymove other)
    (cond
      [(or (equal? (length other) 0) (equal? (length other) 1)) 'paper]
      [else 'rock]))
  (map mymove opponent-history))

(define (champion h) (cons 'paper (cons 'scissors (cons 'rock (cons 'paper (cons 'paper (cons 'scissors (champion h))))))))
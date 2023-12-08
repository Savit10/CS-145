#lang lazy

(require "Gen.rkt")
(require "IOStream.rkt")

(define (RPS Player1 Player2)
  (define A (Player1 (history B)))
  (define B (Player2 (history A)))
  (playgame A B))

(define (count-moves seq)
  (define rocks (count (lambda(x)(equal? x 'rock)) (take 1000 seq)))
  (define scissors (count (lambda(x)(equal? x 'scissors)) (take 1000 seq)))
  (define paper (count (lambda(x)(equal? x 'paper)) (take 1000 seq)))
  (list rocks scissors paper))

(define (max1 lst)
  (max (first lst) (second lst) (third lst)))
(define (min1 lst)
  (min (first lst) (second lst) (third lst)))

(define (bart opponent-history)
  (define (mymove other) 'rock)
  (map mymove opponent-history))

(define (lisa opponent-history)
  (define (mymove other)
    (cond
      [(equal? (max1 (count-moves opponent-history)) (car (count-moves opponent-history))) 'rock]
      [(equal? (max1 (count-moves opponent-history)) (second (count-moves opponent-history))) 'rock]
      [else 'scissor]))
  (map mymove opponent-history))

(define (maggie opponent-history)
  (define (mymove other)
    (cond
      [(equal? (max1 (count-moves opponent-history)) (car (count-moves opponent-history))) 'paper]
      [(equal? (max1 (count-moves opponent-history)) (second (count-moves opponent-history))) 'rock]
      [else 'scissor]))
  (map mymove opponent-history))

(define (champion opponent-history)
  (define (mymove other)
    (cond
      [(= 0 (max1 (count-moves opponent-history))) (car (shuffle (list 'rock 'paper 'scissors)))]
      [(= (max1 (count-moves opponent-history)) (second (count-moves opponent-history))) 'rock] ;If scissors is played alot then play rock
      [(= (max1 (count-moves opponent-history)) (car (count-moves opponent-history))) 'paper] ;If rock is played most then it will beat bart
      [(= (max1 (count-moves opponent-history)) (last (count-moves opponent-history))) 'scissors] ;If papper is played more play sicssors
      ))
  (map mymove opponent-history))
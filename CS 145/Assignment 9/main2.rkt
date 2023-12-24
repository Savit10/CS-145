#lang racket

(require "ordered-set.rkt")
(require "total-order.rkt")
(require "stream.rkt")

(define-struct to-rep (hidden))

(define (count s)
  (count-helper empty s))

(define (count-helper set s)
  (stream-generate s 
                   (λ(x) (stream-empty? x))
                   (λ(x) (stream-cdr x))
                   (λ(x) (occurrence-finder (os-union set (os-singleton (to-hide (stream-car x)))) (stream-car x)))))


(define (occurrence-finder s n)
  (occurrence-finder-helper s n 0))

(define (occurrence-finder-helper s n counter)
  (cond
    [(or (empty? s) (not (os-member s (to-hide n)))) (list n counter)]
    ; if the tree is empty OR if there's no instances of n in the tree, return a list with (n counter) as the question specifies

    ;[else (occurrence-finder-helper (deleteavl s n) n (add1 counter))])) ; if n exists in the tree, remove the first instance, delete that element, then repeat
    [else (occurrence-finder-helper (os-difference s (os-singleton (to-hide n))) n (add1 counter))]))

(stream->list (count (list->stream (list 3 7 3 9 7 3))))
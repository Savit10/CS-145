#lang racket
(define (sumto n) (if (zero? n) 0 (+ n (sumto (sub1 n)))))
(define (Sumto n) (Sumto-helper Sumto-helper n))

(define (Sumto-helper self n)
  (if (zero? n) 0 (+ n (self self (sub1 n)))))

(define (SUMTO n)
  ((lambda (self n) (if (zero? n) 0 (+ n (self self (sub1 n))))
   (lambda (self n) (if (zero? n) 0 (+ n (self self (sub1 n)))))
   n)))

#|(define (occurrence-finder-helper s n counter)
  (cond
     [(or (empty? s) (not (os-member s (to-hide n)))) counter]
    [else (occurrence-finder-helper (os-difference s (os-singleton (to-hide n))) n (add1 counter))]))

(define (occurrence-finder-helper s n counter)
  (cond
     [(or (empty? s) (not (os-member s (to-hide n)))) (list n counter)]
    [else (occurrence-finder-helper (os-union (os-singleton (to-hide n)) (os-difference s (os-singleton (to-hide n)))) n (add1 counter))]))|#

#|(define (count-helper set s)
  (stream-generate s 
                   (λ(x) (stream-empty? x))
                   (λ(x) (stream-cdr x))
                   (λ(x) (occurrence-finder (fill-set (stream-car x) empty (stream-car x)))))) 

(define (fill-set s set)
  (cond
    [(stream-empty? s) set]
    [else (fill-set (stream-cdr s) (os-union set (to-rep (list (stream-car s) 0))))])) |#
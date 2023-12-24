;; Leaderboard Savit

#lang lazy

(require "IOStream.rkt")
(require "Gen.rkt")

(define Nats
  (Gen
    0
    1
   (lambda (value increment cont)
     (cont 
        (+ increment value)
        1
        (list value)))))

(define (mymap f s)
  (Gen
   s        
   0        
   (lambda (stream state cont)
     (if (empty? stream) empty
       (cont (cdr stream) 0 (list (f (car stream))))))))

(define (Kill k s)
  (Gen
   s
   k
   (lambda (stream state cont)
     (cond
       [(empty? stream) empty]
       [(not(zero? (modulo (car stream) k))) (cont (cdr stream) k (list (car stream)))]
       [else (cont (cdr stream) k empty)]))))

#|(define primes
  (cons 2 
  (Gen
   3     
   0       
   (lambda (number state cont)
     (if (prime? number) (cont (+ 2 number) 0 (list number))
       (cont (+ 2 number) 0 empty))))))|#

(define twinprimes
  (cons (list 3 5)
   (Gen
   5
   7
   (lambda (number state cont)
     (if (and (prime? number) (prime? state)) (cont (+ 6 number) (+ 6 state) (list (list number state)))
         (cont (+ 6 number) (+ 6 state) empty))))))

(define (prime? n)
  (if (<= n 1) #f
  (generate (floor (sqrt n)) 
            (lambda(x) (integer? (/ n x)))
            (lambda(x) (sub1 x))
            (lambda(x) (= x 1))))) 

#|(define (prime? n)
  (define (sieve lst)
            (cond [(empty? lst) empty]
                  [(> (first lst) (sqrt n)) lst]
                  [else (cons (first lst)
                              (sieve (filter (lambda (x)(not (= 0 (remainder x (first lst)))))
                                             (rest lst))))]))
  (sieve (filter (lambda (y) (> y 2)) (build-list n #|(inexact->exact(floor (sqrt n)))|# add1))))|#
  

(define (primes n)
  (define (sieve lst)
            (cond [(empty? lst) empty]
                  [(> (first lst) (sqrt n)) lst]
                  [else (cons (first lst)
                              (sieve (filter (lambda (x)(not (zero? (remainder x (first lst)))))
                                             (rest lst))))]))
  (sieve (filter (λ (y) (>= y 2))(build-list n add1))))

#|(define (sieve lst)
    (cond [(empty? lst) empty]
          [else (cons (first lst)
                      (sieve (filter (lambda (x)(not (= 0 (remainder x (first lst)))))
                                     (rest lst))))]))|#
  
(define (generate first done? step final)
  (define (gen first)
    (if (done? first) (final first) (gen (step first))))
  (gen first))

(outstream (take 1000 twinprimes))
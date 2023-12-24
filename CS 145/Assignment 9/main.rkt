#lang racket

(require "ordered-set.rkt")
(require "total-order.rkt")
(require "stream.rkt")

(define-struct to-rep (hidden))
(define (generate first done? step final)
  (define (gen first)
    (if (done? first) (final first) (gen (step first))))
  (gen first))

(define (count s)
  (count-helper empty s))

(define (count-helper set s)
  (stream-generate s 
                   (λ(x) (stream-empty? x))
                   (λ(x) (stream-cdr x))
                   (λ(x) (occurrence-finder (insertavl set (make-to-rep (stream-car x))) (stream-car x)))))

(define (occurrence-finder s n)
  (occurrence-finder-helper s n 0))

(define (occurrence-finder-helper s n counter)
  (cond
    [(or (empty? s) (not (os-member s n))) (list n counter)]
    [else (occurrence-finder-helper (deleteavl s n) n (add1 counter))]))

#|(define (occurrence-finder s n)
  (generate
   (list n 0) 
   (λ(x) (not (os-member s n)))
   (λ(x) (list (deleteavl s n) (add1 (second x))))
   (λ(x) (list n (second x))))) |#

(define-struct node (data height left right))

(define (height t) (if (empty? t) 0 (node-height t)))

(define (build-node d L R) (make-node d (add1 (max (height L) (height R))) L R))

(define (subst-L t p) (build-node (node-data t) p (node-right t)))

(define (subst-R t p) (build-node (node-data t) (node-left t) p))

(define (raise_right t)
  (define tt (subst-R t (node-left (node-right t))))
  (subst-L (node-right t) tt))

(define (raise_left t)
  (define tt (subst-L t (node-right (node-left t))))
  (subst-R (node-left t) tt))

(define (rebalance t)
  (cond
    [(empty? t) t]
    [(> (height (node-left t)) (add1 (height (node-right t))))
       (raise_left 
         (if (> (height (node-right (node-left t))) (height (node-left (node-left t))))
             (subst-L t (raise_right (node-left t))) t))]
    [(> (height (node-right t)) (add1 (height (node-left t))))
       (raise_right 
         (if (> (height (node-left (node-right t))) (height (node-right (node-right t))))
             (subst-R t (raise_left (node-right t))) t))]
    [else t]))

(define (insertavl t d)
  (cond
    [(empty? t) (build-node d empty empty)]
    [(to< d (node-data t)) (rebalance (subst-L t (insertavl (node-left t) d)))]
    [(to> d (node-data t)) (rebalance (subst-R t (insertavl (node-right t) d)))]
    [else t]))

(define (get_rightmost t)
  (cond
    [(empty? (node-right t)) (node-data t)]
    [else (get_rightmost (node-right t))]))

(define (remove_rightmost t)
  (cond
    [(empty? (node-right t)) (node-left t)]
    [else (rebalance (subst-R t (remove_rightmost (node-right t))))]))

(define (deleteavl t d)
  (cond
    [(empty? t) t]
    [(to< d (node-data t)) (rebalance (subst-L t (deleteavl (node-left t) d)))]
    [(to> d (node-data t)) (rebalance (subst-R t (deleteavl (node-right t) d)))]
    [(empty? (node-right t)) (rebalance (node-left t))]
    [(empty? (node-left t)) (rebalance (node-right t))]
    [else
      (rebalance
        (build-node (get_rightmost (node-left t)) (remove_rightmost (node-left t)) (node-right t)))]))

(define (os-member t d)
  (cond
    [(empty? t) false]
    [(to< d (node-data t)) (os-member (node-left t) d)]
    [(to> d (node-data t)) (os-member (node-right t) d)]
    [else true]))

(stream->list (count (list->stream (list 3 7 3 9 7 3))))
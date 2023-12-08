#lang scheme

;; Total Order ADT used by Ordered Set ADT

;; Must provide:
;;   a membership predicate
;;   a total order
;;   min and max functions with identities
;;   user-defined associative operator and identity
;;
;;   any other operations required by the user
;;       e.g. to-hide and to-unhide

(provide to? to< to<= to> to> to>= to= to!= to-min to-min-ident 
         to-max to-max-ident to-op to-op-ident to-hide to-unhide)

;; For this example, we use a number hidden in a struct

   (define-struct to-rep (lst))
   (define (to-unhide x) (to-rep-lst x))
   (define (to-hide x) (make-to-rep x))

;; membership predicate

   (define (to? x) (and (to-rep? x) (list? (to-rep-lst x))))

;; defining relation must be total, reflexive, transitive
   (define (to<= a b)
     (cond
      [(symbol<? (car (to-rep-lst a)) (car (to-rep-lst b))) true]
      [(symbol<? (car (to-rep-lst b)) (car (to-rep-lst a))) false]
      [else (if (> (second(to-rep-lst a)) (second(to-rep-lst b))) false true)]))

;; derived relations
   (define (to> a b) (not (to<= a b)))
   (define (to= a b) (and (to<= a b) (to<= b a)))
   (define (to>= a b) (to<= b a))
   (define (to< a b) (to> b a))
   (define (to!= a b) (not (to= a b)))

;; min/max functions and identities
   
   (define (to-min a b) (if (to<= a b) a b))
   (define to-min-ident (to-hide (list'^ +inf.0)))

   (define (to-max a b) (if (to<= a b) b a))
   (define to-max-ident (to-hide (list'? -inf.0)))

;; user-defined associative operator and identity

;; for this example we just add the secret numbers

   (define (to-op a b)
     (cond
     [(< (second (to-unhide a)) (second (to-unhide b))) b]
     [(< (second (to-unhide b)) (second (to-unhide a))) a]
     [else
      (cond
      [(symbol<? (first (to-unhide a)) (first (to-unhide b))) a]
      [else b])]))
   (define to-op-ident (make-to-rep (list'? -inf.0)))
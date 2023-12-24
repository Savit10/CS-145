#lang racket
; Total Order (formal definiiion)
; Given a set S with (of anything), Total Order is a relation T such that for every a,b that are elements of S
; a T a is true (reflexive property)
; a T b or b T a is true (totality)
; a T b and b T a is => implies a = b
; a T b is true and b T c is true => a T c is true (transitive property)
; Pair (S, T) is a totally ordered set
; S can be any set (reals, naturals, etc) while T can be <=, >= , < , >

; Ordered List (ins, e, lst, T)
; (define (ins e lst T)  -> assume lst is ordered by T, create new list with e + elements of lst and is still ordered
;   (cond
;     [(empty? lst) (list e)]
;     [(T e (car lst)) (cons e lst)]
;     [else (cons (car lst) (ins e (cdr lst)) T)]))


(define (ol-ins e lst T)
  (cond
    [(empty? lst) (list e)]
    [(T e (car lst)) (cons e lst)]
    [else (cons (car lst) (ol-ins e (cdr lst) T))]))

; Strict Total Order (<. >) vs Total Order (<=, >=)

; Strict Total Order (formal definiiion)
; Given a set S with (of anything), Total Order is a relation L such that for every a,b,c that are elements of S
; a L a is not true (anti-reflexive)
; For all a != b, a L b or b L a is true (totality)
;         or a L b => not b L a
; a L b and b L c is => implies a L c is true (transitive property)
; Pair (S, T) is a totally ordered set
; S can be any set (reals, naturals, etc) while T can be <=, >= , < , >

(define (ols-ins e lst LT)
  (cond
    [(empty? lst) (list e)]
    [(LT e (car lst)) (cons e lst)]
    [else (cons (car lst) (ols-ins e (cdr lst) LT))]))


(foldl (lambda(a b) (ol-ins a b <)) empty (build-list 10 add1))
(foldl (lambda(a b) (ol-ins a b >)) empty (build-list 10 add1))
(foldl (lambda(a b) (ol-ins a b <)) empty (build-list 10 (random 10)))

(define (insertion-sort lst LT)
  (foldl (lambda (a b) (ol-ins a b  LT) empty lst)))45
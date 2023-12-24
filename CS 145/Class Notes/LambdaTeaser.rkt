;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname LambdaTeaser) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Intermediate Student with Lambda - modeled after Lambda Calculus --> it's a model of computation (Alonzo Church 1930's)
; Lambda parameters
 
(define (foo x) (+ x x))
(define (bar x) (* 3 x))

(define (doublist list)
  (if (empty? list) empty (cons (foo (car list)) (doublist (cdr list)))))

(define (fredlist fred list); entering a function as a parameter fred
  (if (empty? list) empty (cons (fred(car list)) (fredlist fred (cdr list)))))

(define 1st (list 10 20 30 40))

; map is a function that is in-built into racket
;(define (add2 x) (+ x 2))
;(build-list 4 add2) ; build-list can generate a list from 0 upto (n-1) and can apply a function to each element
;(define add2 (λ(x) (+ x 2)))
; foldl -> applied a function to a list
; foldr --> applies a function in the list to reverse

(define (addto n)(lambda (x) (+ n x)))
(define add2 (addto 2))

 
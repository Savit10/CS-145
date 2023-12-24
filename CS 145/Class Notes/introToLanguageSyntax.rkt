;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname introToLanguageSyntax) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(+ 1 2 3)

(define foo (+ 1 2 3))

foo

(define (bar x) (+ x x x)) ; arithmetic operators like +, -, *, / are not binary in racket

(bar 3)

(quote foofoo)

(< 2 3) ; truth values (boolean)

(= 2 2 2) #|comparison operators like =, <, > are not binary in racket |#

(number? 42) ; predicates (boolean functions) that look at the data tyoe of the value
(number? "hello")

(string? "hello") ;predicates are there for all data types
(symbol? 'fred)

(integer? 42)
(integer? (/ 42 2))
(integer? (/ 42 5))

(rational? (/ 42 5))
(rational? (sqrt 2))

(real? (/ 42 5))
(real? (sqrt -2)) ; complex number so not real

false
true
#f
#t
#true
#false
(not true) ; boolean functions (also not binary operators)
(not false)

(and true true true) ;special form
(and true false true)

(or true false true)
(or false false false) ;special form

(or true (zero? 'foo)) ;special function since it only evaluates the first expression and, if and only if needed, it evaluates the next value

(and (> 10 1) (zero? foo))
(if (< 10 1) 'truepart  'falsepart); special form for conditional evaluation
;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname introToRecursion) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; sum integers from 1 to 10

;(define sumTo9 (+ 1 2 3 4 5 6 7 8 9))
;(define sumTo10 (+ sumTo9 10)) ; recursion
;(define sumTo5 (+ 1 2 3 4 5))
;(define sumTo6 (+ sumTo5 6))

; sum integers from 1 to n

(define (sumTo N)
  (if (< N 1) 0 (+ (sumTo(- N 1)) N))) 

; closed form formula (mathematical) for sumTo N: (N(N+1))/2
; recursive solution to sumTo N: n + sumTo[n-1}

; closed form formula (mathematical) for the number of steps 5n + 3
; recursive solution to sumTo N: 5 + steps[n-1]

;(sumTo 3)

(sumTo 400)

(define (sumbetween a b acc) ; sum integers between a and b PLUS acc
    (if (< b a) acc (sumbetween (+ a 1) b (+ acc a))))

(define (new-sumTo N) (sumbetween 0 N 0))

(new-sumTo 400)
























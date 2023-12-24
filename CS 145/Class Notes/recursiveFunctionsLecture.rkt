;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname recursiveFunctionsLecture) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (thing x) ; x is a non-negative integer
  (if (< x 10) 1 (add1 (thing (quotient x 10)))))

; (thing 1000)  algorithm determines the number of digits in x, thing[x] = { (1) if x = 0, (floor(log10x) + 1) x > 0 }
; digits  |  steps
; 1           3
; 2           8
; 3           13
; general form of steps: 5n - 2, where n is the number of digits

(define (pow x n) ; x non-zero, non-negative integer
  (if (zero? n) 1 (* (pow x (sub1 n)) x )))

(define (pow2 x n); x non-zero, non-negative integer
  (if (zero? n)
      1
      (if (odd? n)
          (* (pow2 x (sub1 n)) x) ; when power is odd
          (sqr (pow2 x (quotient n 2 ))))))  ; when power is even

;(pow 10 2)
; pow2's n |  steps
; 0             3
; 1             10
; 2             17
; 3             24
; 4             24
; 5             31
; pattern: if n = 2^k, steps = 7k+3
; pattern: if n != 2^k, steps >= steps for n = 2^k

(pow2 10 2)

(define (pow3 x n)
  (if (zero? n)
      1
      (if (odd? n)
          (* (pow3 x (sub1 n)) x)
          (* (pow3 x (quotient n 2)) (pow3 x (quotient n 2))))))
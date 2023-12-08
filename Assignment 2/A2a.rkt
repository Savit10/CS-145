;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname A2a) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (step-count-k n) (+ (* 5 n) 3))

(define (step-count-l n) (if (= n 0) 3 (+ (* 2 (step-count-l (- n 1))) 6)))

(define (logarithm-base-2 n) (if (equal? (/ n 2) 1) 1 (+ (logarithm-base-2(/ n 2)) 1)))

(define (m n) (if (= n 0) 1 (* n (m (quotient n 2)))))

(define (step-count-m n)  (if (equal? n 0) 3 (if (equal? n 1) 8 (+(* 5 (logarithm-base-2 n)) 8))))

(define (logarithm n) (if (equal? n 1) 0 (if (equal? (floor(/ n 2)) 1) 1 (+ (logarithm(floor(/ n 2))) 1))))

(define (step-count-n n)  (if (equal? n 0) 3 (if (equal? n 1) 8 (+(* 5 (logarithm n)) 8))))

(define (step-count-o n) (if (equal? n 0) 3 (+ 12 (* 18 ( - (expt 2 (logarithm n)) 1)))))


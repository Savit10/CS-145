;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname A2b) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (steps-fib n) (steps-fib-help n 3 3))

(define (steps-fib-help n acc1 acc2)
  (if (<= n 1) acc2
      (steps-fib-help (sub1 n) acc2 (+ 6 acc1 acc2))))

;(define (steps-fib n) (if (or (equal? n 0) (equal? n 1)) 3 (if (equal? n 2) 12 (+(* (/ 3 2) (expt n 3)) (*(/ -27 2) (expt n 2)) (* 57 n) -69))))

(define (step-count-k n) (+ (* 5 n) 3))

(define (compare-steps-k n) (if (< (steps-fib n) (step-count-k n)) 'fewer (if (equal? (steps-fib n) (step-count-k n)) 'same 'more)))

(define (step-count-l n) (if (= n 0) 3 (+ (* 2 (step-count-l (- n 1))) 6)))

(define (compare-steps-l n) (if (< (steps-fib n) (step-count-l n)) 'fewer (if (equal? (steps-fib n) (step-count-l n)) 'same 'more)))

(define (logarithm-base-2 n) (if (= (/ n 2) 1) 1 (+ (logarithm-base-2(/ n 2)) 1)))

(define (step-count-m n)  (if (equal? n 0) 3 (if (equal? n 1) 8 (+(* 5 (logarithm n)) 8))))

(define (compare-steps-m n)
  (if (= n 0) 'same (if (or (= n 2) (= n 1)) 'fewer 'more)))

(define (logarithm n) (if (equal? n 1) 0 (if (equal? (floor(/ n 2)) 1) 1 (+ (logarithm(floor(/ n 2))) 1))))

(define (step-count-o n) (if (equal? n 0) 3 (+ 12 (* 18 ( - (expt 2 (logarithm n)) 1)))))

(define (compare-steps-o n) (if (< (steps-fib n) (step-count-o n)) 'fewer (if (equal? (steps-fib n) (step-count-o n)) 'same 'more)))

(define (step-count-t n) (+ (* 5 n) 4))

;(fib 0) ;3
;(fib 1) ;3
;(fib 2) ;12
;(fib 3) ;21
;(fib 4) ;39
;(fib 5) ;66
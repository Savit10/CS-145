;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname A3a) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct thing (a b))
   (define u (make-thing 1 2))
   (define v (make-thing (make-thing (make-thing 1 2) (make-thing 3 4))  
                         (make-thing (make-thing 5 6) (make-thing 7 8))))
   (define w (make-thing 
               (make-thing 
                 (make-thing 
                   (make-thing 
                     (make-thing 
                       (make-thing 
                         (make-thing 1 2) 3) 4) 5) 6) 7) 8))

(define (sum-thing x)
  (if (thing? x) (+(sum-thing(thing-a x)) (sum-thing(thing-b x))) x))

(define (build-thing m n)
 (if (equal? m (- n 1)) (make-thing m n) (make-thing (build-thing m (- n 1)) n)))

(define (helper m n)
  (if (= m n) m
      (if (or (= m (+ n 1)) (= n (- n 1)))
          (make-thing m n)
          (make-thing (helper m (floor (/ (+ m n) 2))) (helper (floor (+(/ (+ m n) 2)1)) n)))))
(define (build-thing-or-number n)
  (if (= n 1) 1
      (make-thing (helper 1 (floor (/ (+ 1 n) 2))) (helper (floor (+(/ (+ 1 n) 2)1)) n))))

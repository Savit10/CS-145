;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Decorated Binary Trees|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct ht (l r h))

(define t0 empty)
(define t1 (make-ht empty empty 1))
(define t2 (make-ht empty t1 2))
(define t3a (make-ht empty t2 3))
(define t3b (make-ht t2 t2 3))

(define (smart-ht l r)
  (make-ht l r (add1 (max (ht-h 1)(ht - h r)))))
(define (height t) (if empty? t) (ht-h t))
  
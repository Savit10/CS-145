#lang lazy
(require "Lambda.rkt")
(define (MUL a b)
  (MUL-helper (Car (remove-trailing-zeroes a b a b)) (Cdr (remove-trailing-zeroes a b a b)) Empty))

(define (remove-trailing-zeroes a b res1 res2)
  (If (Z? a) (Cons res1 res2)
      (If (Z? b) (Cons res2 res1)
          (remove-trailing-zeroes (Cdr a) (Cdr b) res1 res2))))

(define (MUL-helper x y z)
  (If (Z? x) Z
      (If (Car x)
          (ADD (Create z y) (MUL-helper (Cdr x) y (Cons False z)))
          (MUL-helper (Cdr x) y (Cons False z)))))

(define (Create c b)
  (If (Z? c) b
      (Create (Cdr c) (Cons False b))))

(TAN (MUL (NAT 16) (NAT 24)))
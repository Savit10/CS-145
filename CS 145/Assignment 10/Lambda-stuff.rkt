#lang lazy
(define (Or A B)
  ((A (lambda (yes) (lambda (no) yes))) B))

(define (AND A B)
  ((A B) (lambda (yes) (lambda (no) no))))

(define (NOT A)
  ((A (lambda (yes) (lambda (no) no))) (lambda (yes) (lambda (no) yes))))

(define (Not a) (If a False True))

(define (If test thenpart elsepart)
  ((test thenpart) elsepart))

(define True (lambda (yes) (lambda (no) yes)))
(define False (lambda (yes) (lambda (no) no)))

(((AND True True) 'yes) 'no)

(define Empty (lambda (x) True))
(define (Empty? lst) (lst (lambda (yes) (lambda (no) False))))

(define (Cons Car Cdr)
  (lambda (selector) ((selector Car) Cdr)))

(define Z Empty)
(define Z? Empty?)

(define (Car pair) (pair True))
(define (Cdr pair) (pair False))

(define Y
  (lambda (f)
    ((lambda (self) (f (self self)))
     (lambda (self) (f (self self))))))

(define (SUB a b)
  (If (Z? a) b
      (If (Z? b) a
          (SUB-helper a (reverse-binary b)))))

(define (ADD1 x)
   (If (Z? x)
       (Cons True Z)
       (If (Car x) (Cons False (ADD1 (Cdr x)))
           (Cons True (Cdr x)))))

(define (ADD a b)
  (If (Z? a) b
   (If (Z? b) a
    (If (NOT (Car a)) (Cons (Car b) (ADD (Cdr a) (Cdr b)))
     (If (NOT (Car b)) (Cons (Car a) (ADD (Cdr a) (Cdr b)))
       (Cons False (ADD1 (ADD (Cdr a) (Cdr b)))))))))

(define (SUB-helper a b)
  (If (Car (ADD a b)) (ADD1 (Cons False (Cdr (ADD a b))))))

(define (reverse-binary b)
  (If (Z? b) Z
      (If (Z? (Cdr b)) (Not (Car b)) 
          (If (Car b) (Cons False (reverse-binary (Cdr b)))
              (Cons True (reverse-binary (Cdr b)))))))

(define (TAN x)
  (If (Z? x) 0
      (If (Car x)
          (add1 (* 2 (TAN (Cdr x))))
          (* 2 (TAN (Cdr x))))))

(define (NAT n)
  (if (zero? n) Z (ADD1 (NAT (sub1 n)))))

(Not True)

(TAN(reverse-binary (NAT 12)))

;(TAN (SUB (NAT 16) (NAT 15)))




#lang lazy
(require "Lambda.rkt")
(define (Add1 n)
  ((lambda (func); Y-combinator
    ((lambda (self) (func (self self)))
     (lambda (self) (func (self self)))))
 (lambda (add1)
  (lambda (x)
  (((x (lambda (yes) (lambda (no) (lambda (yes) (lambda (no) no)))))
       (lambda (selector) ((selector (lambda (yes) (lambda (no) yes))) (lambda (x) (lambda (yes) (lambda (no) yes))))))
       (((x (lambda (yes) (lambda (no) yes))) (lambda (selector) ((selector (lambda (yes) (lambda (no) no))) (add1 (x (lambda (yes) (lambda (no) no)))))))
           (lambda(selector) ((selector (lambda (yes) (lambda (no) yes))) (x (lambda (yes) (lambda (no) no)))))))))))

(TAN (Add1 (NAT 2)))
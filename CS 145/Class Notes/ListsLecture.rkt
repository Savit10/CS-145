;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ListsLecture) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (my-reverse list)
  (cond
    [(empty? list) list]
    [true (snoc (my-reverse (cdr list)) (car list))]))
(define (snoc list e)
  (if (empty? list)(cons e empty) (cons (car list) (append (cdr list) (cons e empty)))))

(define (reverser a b)
  (cond
    [(empty? a) b]
    [true (reverser (cdr a) (cons (car a) b))]))

(define (reversing list) (reverser list empty))

; List-> Tree
; inserter[1st, tree]
; Trees-Lists -> traverser[tree, list]
; Pre-Order (cons root (pre-order left) (pre-order left))
; In-order (append inorder[left] (list root) inorder[right])

(require "module.rkt")
         
    
(define (baf x) (* x x))


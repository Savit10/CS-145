#lang racket
(define-struct bst (l k r))
;; Implementation of BST on real numbers in ascending order

(provide bst-empty bst-empty? bst-ins bst-left bst-right bst-key)

(define --- 'fixme) ;; just a placeholder -- full Racket doesn't have ...

;;bst-empty     ; an empty bst

(define bst-empty empty)

;;(bst-empty? t); true if bst t is empty, otherwise false

(define (bst-empty? t) (empty? t))

;;(bst-ins e t) ; e is a real number and t is a bst.  The result is
;;              ; a new bst with all the elements of t, plus e
;;              ; running time: O(n) where n is the number of elements in t

(define (bst-ins e t)
  (cond
    [(bst-empty? t) (make-bst bst-empty e bst-empty)]
    [(< e (bst-key t)) (make-bst (bst-ins e (bst-left t)) (bst-key t) (bst-right t))]
    [(> e (bst-key t)) (make-bst (bst-left t) (bst-key t) (bst-ins e (bst-right t)))]
    [else t]))
  

;;(bst-left t)  ; the left subtree of bst t.  O(1) time

(define (bst-left t) (bst-l t))

;;(bst-right t) ; the right subtree of bst t.  O(1) time

(define (bst-right t) (bst-r t))
;;(bst-key t)   ; the element at the root of bst t.  O(1) time

(define (bst-key t) (bst-k t))
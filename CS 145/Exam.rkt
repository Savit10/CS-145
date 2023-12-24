#lang racket
;; Savit Agarwal, Student ID: 21084147, User ID: s87agarw
;; CA145 Midterm Test.  October 30, 2023

;; NO AIDS Permitted.
;; You must write this exam using virtual desktop in full-screen mode
;; Scrap paper is provided.

;; Time limit:  110 minutes (1 hour, 50 minutes)
;; Total marks: 20
;; Suggested pacing:  5 minutes per mark

;; This definition is a placeholder.  In order to answer the
;; exam questions you will replace references to --- with your
;; solutions
(define --- 'placeholder)


;; Question 1 [4 marks, suggested time 20 minutes]

;; Modify the file bst.rkt to implement
;; binary search trees with the following values and operations:
;;
;; bst-empty     ; an empty bst
;; (bst-empty? t); true if bst t is empty, otherwise false
;; (bst-ins e t) ; e is a real number and t is a bst.  The result is
;;               ; a new bst with all the elements of t, plus e
;;               ; running time: O(n) where n is the number of elements in t
;; (bst-left t)  ; the left subtree of bst t.  O(1) time
;; (bst-right t) ; the right subtree of bst t.  O(1) time
;; (bst-key t)   ; the element at the root of bst t.  O(1) time
;;
;; You must provide implementations for these values and operations.
;; You may use helper functions but you must not provide them.
;;
;; Here are some examples of how your module should behave:

(require "bst.rkt")
(define t1 (bst-ins 10 (bst-ins 30 (bst-ins 20 bst-empty))))
(define t2 (bst-ins 10 (bst-ins 20 (bst-ins 30 bst-empty))))
(bst-empty? t1)          ; should be false
(bst-empty? bst-empty)   ; should be true
(bst-key (bst-right t1)) ; should be 30
(bst-key (bst-left t2))  ; should be 20

;; Question 2 [4 marks, suggested time 20 minutes]

;; Assume a correct implementation of bst.rkt as defined in Question 1.

;; Replace --- in the defintion below for (preorder t) that creates
;; a list containing the left-to-right preorder traversal of t.  You
;; may define helper functions if needed.

;; For full marks your solution should run on O(n) time where n is
;; the number of elements in t

(require "bst.rkt")

(define (preorder t) (preorder-helper t '()))

(define (preorder-helper t lst)
 (cond
   [(empty? t) lst]
   [true (cons (bst-key t) (preorder-helper (bst-left t) (preorder-helper (bst-right t) lst)))]))

;; Example:

(preorder t1) ; should be (list 20 10 30)

;; Question 3 [4 marks, suggested time 20 minutes]

;; Assume a correct implementation of bst.rkt as defined in Question 1.

;; Fill in the definition below to implement (bst-map f t)
;; that creates a new bst t2 with the same shape as t replacing
;; each element e in t by (f e).  Assume that f is monotone
;; increasing; that is, if x1 > x0, then f(x1) > f(x0).  Assume
;; that t is created using the operations from bst.rkt
;; Assume the running time of f is O(1).
;; The running time of bst-map should be O(n^2) where n
;; is the number of elements in t.

(require "bst.rkt")
;list->bst: converts a list to bst.
(define (list->bst lst t)
  (cond
    [(empty? lst) t]
    [(empty? (cdr lst)) (bst-ins (car lst) t)]
    [else (list->bst (cdr lst) (bst-ins (car lst) t))]))  

;bst-map: Converts the tree into a preorder list, maps the function onto the elements
; and then converts the list back into a tree
(define (bst-map f t)
  (cond
    [(empty? t) empty]
    [else (list->bst(map f (preorder t)) empty)]))

(define (bst-map2 f t)
  (foldl bst-ins empty (map f (preorder t))))

;; Example:

(preorder (bst-map2 sqr t1)) ; should be (list 400 100 900)

;; Question 4 [4 marks, suggested running time 20 minutes]

;; Assume a correct implementation of bst.rkt as defined in Question 1.

;; Fill in the definition below to implement (bst-remap f t)
;; that creates a new bst t2 that may be a different shape
;; from t, but contains elements (f e) for each e in t. That is,
;; the elements of (bst-remap f t) will be the same as the
;; elements of (bst-map f t), but the result may be a different shape.
;; Assume that f is monotone
;; increasing; that is, if x1 > x0, then f(x1) > f(x0).  Assume
;; that t is created using the operations from bst.rkt
;; Assume the running time of f is O(1).
;; The running time of bst-remap should be O(n log n) where n
;; is the number of elements in t.

(require "bst.rkt")
; Idea: Traversing through the tree and mapping the elements with the functions while traversing
(define (bst-remap f t)
  (cond
    [(empty? t) empty]
    [(and (empty? (bst-left t)) (empty? (bst-right t))) (f (bst-key t))]
    [(empty? (bst-left t)) (bst-remap f (bst-right t))]
    [(empty? (bst-right t)) (bst-remap f (bst-left t))]
    [else (bst-remap f (bst-left t)) (f (bst-key t)) (bst-remap f (bst-right t))]))

;; Example:

;(preorder(bst-remap sqr t2)) ; could be (list 400 100 900)

;; Question 5 [4 marks, suggested time 20 minutes]

;; Replace --- below to give the
;; smallest O() that describes the running time of
;; the following expressions, as a function of N

(define N 8) ; 8 is just a placeholder, you want big-O of N

;(build-list N add1)
(define q5a-runtime "O(N)")

;(build-list N (lambda(x)(build-list x add1)))
(define q5b-runtime "O(N^2)")

;(build-list N (lambda(x)(build-list (inexact->exact (floor (expt x 1.53))) add1)))
(define q5c-runtime "O(N^3.53)")

;(build-list N (lambda(x)(build-list (quotient N (expt 2 x)) add1)))
(define q5d-runtime "O(NlogN)")

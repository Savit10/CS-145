#lang scheme
(require "generate.rkt")
(require "btree.rkt")
(define (split t)
  (generate
   (list t false)
   (lambda (x) (second x))
   (lambda (x) (list (list (bt-right (car x)) (make-bt empty (bt-dec (car x)) empty) (bt-left (car x))) true));Returns the right subtree, root node, left subtree
   (lambda (x) (car x))
   )
  )

(define (traverse t)
  (generate
   (list (list t) empty)
   (lambda(x) (empty? (car x)))
   (lambda(x)
     (cond
       [(not (empty? (first (car x))))
        (if (and (empty? (bt-left (first (car x)))) (empty? (bt-right (first (car x)))));Checks if the first tree in the forest is a node
            (list (cdr (first x)) (append (list (bt-dec (first (car x)))) (second x))); if it is a node we remove it from the forest and add it to the accumulator
            (list (append (split (first (car x))) (cdr (car x))) (second x)))]
       [else (list (cdr (first x)) (second x))])); If the first tree in the forest is indeed a tree then we split it and add it to the front of the forest
   (lambda(x) (second x))
     )
   )

(define b (make-bt (make-bt (make-bt (make-bt empty 123 empty) 12 empty) 3 empty) 4 (make-bt empty 11 (make-bt empty 9 (make-bt empty 8 empty)))))

(traverse b)
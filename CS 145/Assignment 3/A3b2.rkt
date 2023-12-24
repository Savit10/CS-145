;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname A3b) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct node (left right))

(define (tree-similar? tree1 tree2)
  (cond
    [(and (empty? (node-left tree1)) (empty? (node-left tree2)) (empty? (node-right tree1)) (empty? (node-right tree2))) #true]
    [(and (node? (node-left tree1)) (node? (node-left tree2)) (node? (node-right tree1)) (node? (node-right tree2))) (and (tree-similar? (node-left tree1) (node-left tree2)) (tree-similar? (node-right tree1) (node-right tree2)))]
    [else #false]))

(tree-similar? (make-node (make-node empty empty) (make-node empty empty)) (make-node (make-node empty empty) (make-node empty empty)))
                                           
(define (tree-create n)
  (if (= n 0) '() (if (= n 1) (make-node empty empty) (make-node (tree-create (- n 1)) empty))))
(define (tree-create-c n)
  (if (= n 0) '() (if (= n 1) (make-node empty empty) (make-node empty (tree-create-c(- n 1))))))
(define (tree-create-d n)
  (if (= n 0) '() (if (= 0(modulo n 2)) (make-node empty (tree-create-d(- n 1))) (make-node (tree-create-d (- n 1)) empty))))
(define (tree-count n)
  (if (= n 0) 0 (if (= n 1) 1 (+(* 2 (tree-count(- n 1))) (tree-count(- n 2))))))

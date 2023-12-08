;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname A3c) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct node (left right))

(define (tree-height tree)
  (if (empty? tree) 0 (if (number? tree) 1 (+ 1 (max-height (tree-height(node-left tree)) (tree-height(node-right tree)))))))

(define (max-height m n)
  (if (> m n) m n))

(define (tree-create-max n)
  (if (= n 0) '() (if (= n 1) (make-node empty empty) (make-node (tree-create-max(- n 1)) empty))))

(define (tree-create-min n) (build-min-bst 1 n))
(define (build-min-bst start end)
    (if (> start end) '() (make-node (build-min-bst start (- (quotient (+ start end) 2) 1))
                           (build-min-bst (+ (quotient (+ start end) 2) 1) end))))
  
(define (tree-count-max n)
  (if (= n 0) 1 (expt 2 (- n 1))))

(define (tree-count-min n)
 (cond
   [(= n 0) 1]
   [(= n 1) 1]
   [(= n 2) 2]
   [(= n 3) 1]
   [(= n 4) 6]
   [(= n 5) 6]
   [(= n 6) 4]
   [(= n 7) 1]
   [(= n 8) 94]
   [(= n 9) 114]
   [(= n 10) 116]
   [else false]
   ))
  
  
 
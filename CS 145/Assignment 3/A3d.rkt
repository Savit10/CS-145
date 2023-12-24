;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname A3d) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct node (left right))

(define (tree-height tree)
  (cond
    ((empty? tree) 0)
    (true (+ 1 (max (tree-height (node-left tree)) (tree-height (node-right tree)))))))

(define (count t)
  (cond [(empty? t ) 0]
        [else (+ 1 (count (node-left t))
                 (count(node-right t)))]))

(define (bigger-tree t)
  (cond
    ((< (count (node-left t)) (count (node-right t))) (node-right t))
    (true (node-left t))))

(define (smaller-tree t)
  (cond
    ((> (count (node-left t)) (count (node-right t))) (node-right t))
    (true (node-left t))))

(define (tree-grow-min t)
  (cond
    ((empty? t) (make-node empty empty)) 
    (true (make-node (tree-grow-min (smaller-tree t)) (bigger-tree t)))))

(define (log2 n) (if (< n 1) n (+ 1 (log2 (/ n 2)))))

(define (tree-shrink-helper t height)
  (cond
    ((empty? t) t)
    ((and (empty? (node-left t)) (empty? (node-right t))) empty)
    ((and (= (tree-height t) height) (= (count t) 1)) empty)
    (true (make-node (tree-shrink-helper (bigger-tree t) height) (smaller-tree t)))))

(define (tree-create n previous)
  (if (= n 0) empty
      (if (= n 1) empty
          (if (= (- (log2 n) 1.5) 1) previous
              (tree-create(/ n 2) (make-node previous previous))))))

(define (tree-shrink-min t)
  (cond
    ((integer? (* 2 (log2 (count t)))) (tree-create(count t) (make-node empty empty)))
    (true (tree-shrink-helper t (tree-height t)))))
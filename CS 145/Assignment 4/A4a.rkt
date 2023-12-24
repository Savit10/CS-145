;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname A4a) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct node (left right sz))

(define (tree-height tree)
  (cond
    ((empty? tree) 0)
    ((integer? (log2 (node-sz tree))) (+ 1(log2 (node-sz tree))))
    (else (+ (floor(- (log2 (node-sz tree)) 1)) 1))))

(define (node-size t)
  (if (empty? t) 0 (node-sz t)))

(define (bigger-tree t)
  (cond
    ((and (empty? (node-left t)) (empty? (node-right t))) (node-right t))
    ((< (node-size (node-left t)) (node-size(node-right t))) (node-right t))
    (true (node-left t))))

(define (smaller-tree t)
  (cond
    ((and (empty? (node-left t)) (empty? (node-right t))) (node-left t))
    ((> (node-size (node-left t)) (node-size (node-right t))) (node-right t))
    (true (node-left t))))

(define (tree-grow-min t)
  (cond
    ((empty? t) (make-node '() '() 1))
    ((empty? (node-left t)) (make-node (make-node '() '() 1) (node-right t) (+ (node-sz t) 1)))
    ((empty? (node-right t)) (make-node  (node-left t) (make-node '() '() 1) (+ (node-sz t) 1)))
    (true (make-node (tree-grow-min (smaller-tree t)) (bigger-tree t) (add1 (node-sz t))))))

(define (log2 n) (if (< n 1) n (if (= n 1) 0 (+ 1 (log2 (/ n 2))))))

(define (tree-create n previous)
  (if (or (= n 0) (= n 1)) previous
          (if (= (log2 n) 1) previous
              (tree-create (/ n 2) (make-node previous previous (add1 (* 2 (node-sz previous))))))))

(define (tree-shrink-helper t height)
  (cond
    ((empty? t) t)
    ((and (empty? (node-left t)) (empty? (node-right t))) '())
    ((and (= (tree-height t) height) (= (node-sz t) 1)) '())
    (true (make-node (tree-shrink-helper (bigger-tree t) height) (smaller-tree t) (sub1 (node-sz t))))))

(define (tree-shrink-min t)
  (cond
    ((and (integer? (log2 (node-sz t))) (> (log2 (node-sz t)) 0)) (tree-create (node-sz t) (make-node '() '() 1)))
    (else (tree-shrink-helper t (tree-height t)))))
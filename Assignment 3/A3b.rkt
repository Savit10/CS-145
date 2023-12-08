;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname A3b) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct node (left right))
                                   
(define (tree-similar? a b)
  (cond
    ((and (empty? a) (empty? b)) true)
    ((or (empty? a) (empty? b)) false)
    (true (and (tree-similar? (node-left a) (node-left b)) (tree-similar? (node-right a) (node-right b))))))
  
(define (tree-create n)
  (if (= n 0) '() (if (= n 1) (make-node empty empty) (make-node (tree-create (- n 1)) empty))))
(define (tree-create-c n)
  (if (= n 0) '() (if (= n 1) (make-node empty empty) (make-node empty (tree-create-c(- n 1))))))
(define (tree-create-d n)
  (if (= n 0) '() (if (= 0(modulo n 2)) (make-node empty (tree-create-d(- n 1))) (make-node (tree-create-d (- n 1)) empty))))

(define (fac n m)
  (if (= n 1) m
      (fac (- n 1) (* n m))))
     
(define (tree-count n)
  (cond
    ((= n 0) 1)
    (true (/ (fac (* 2 n) 1) (* (fac n 1) (fac (+ n 1) 1))))))


#|(define (tree-grow-min tree)
  (cond
    ((empty? tree)(make-node empty empty))
    ((empty? (node-left tree)) (make-node (make-node empty empty) empty))
    ((empty? (node-right tree)) (make-node empty (make-node empty empty)))
    ((< (count (node-left tree))  (count (node-right tree))) (make-node empty (tree-grow-min(node-left tree))))
    (true (make-node (tree-grow-min(node-right tree)) empty)))) |#

#| (define (tree-shrink-min tree)
  (cond
    ((empty? tree) tree)
    ((equal? (make-node empty empty) tree) empty)
    ((or (equal? (make-node (make-node empty empty) empty) tree) (equal? (make-node empty (make-node empty empty)) tree)) (make-node empty empty))
    ((> (count (node-left tree)) (count(node-right tree))) (make-node empty (tree-grow-min(node-left tree))))
    (true (make-node (tree-shrink-min(node-right tree)) empty)))) |#

#|(define (combine-bsts bst1 bst2)
    (insert-bst empty (list-to-bst(merge-lists (bst-to-list bst1) (bst-to-list bst2)))))
(define (bst-to-list bst)
  (cond
    [(empty? bst) '()]
    [else (append (bst-to-list (node-left bst))
                  (list (node-key bst))
                  (bst-to-list (node-right bst)))]))

(define (merge-lists list1 list2)
  (cond
    [(empty? list1) list2]
    [(empty? list2) list1]
    [(<= (car list1) (car list2))
     (cons (car list1) (merge-lists (cdr list1) list2))]
    [else
     (cons (car list2) (merge-lists list1 (cdr list2)))]))

(define (list-to-bst list)
  (cond
  [(empty? list) empty]
  [else (make-node (list-to-bst(1st (list-ref (quotient (length list) 2)))) (list-to-bst(drop 1st (list-ref (+ 1(quotient (length list) 2))))) (list-ref (quotient (length list) 2)))]))

#|(define (combine-bst bst1 bst2)
  (cond
    [(empty? bst1) bst2]
    [(empty? bst2) bst1]
    [else (combine-bst bst1 (insert-bst bst1 (node-key bst2)))])) |#

#|(define (in-order-traversal t)
  (if (empty? t) empty
      (if (empty? (node-left t)) (append (in-order-traversal (node-right t)) (node-right t))
          (if (empty? (node-right t)) (append (node-right t) (in-order-traversal (node-right t)))
              (append (in-order-traversal (node-left t)) (list (node-key t)) (in-order-traversal (node-right t))))))) |#
                                                                                                                       |#

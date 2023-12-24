;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname A4b) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct node(left right key))

(define (insert-bst t n)
  (cond
    [(empty? t) (make-node empty empty n)]
    [(= n (node-key t)) t]
    [(< n (node-key t)) (make-node (insert-bst (node-left t) n) (node-right t)  (node-key t))]
    [true (make-node (node-left t) (insert-bst (node-right t)n) (node-key t))]))

(define (find-min-node tree)
  (cond
   [(empty? tree) empty]
   [(empty? (node-left tree)) tree]
   [else (find-min-node (node-left tree))]))

(define (delete-bst t n)
    (cond
    [(empty? t) empty]
    [(> (node-key t) n) (make-node (delete-bst (node-left t) n) (node-right t) (node-key t))]
    [(< (node-key t) n) (make-node (node-left t) (delete-bst (node-right t) n) (node-key t))]
    [else
         (cond
           ((empty? (node-left t)) (node-right t))
           ((empty? (node-right t)) (node-left t))
           (else
            (make-node (node-left t) (delete-bst (node-right t) (node-key (find-min-node(node-right t)))) (node-key (find-min-node(node-right t))))))]))

(define (combine-bst bst1 bst2)
  (cond
        [(and (empty? bst1) (empty? bst2)) empty]
        [(empty? bst1) bst2]
        [(empty? bst2) bst1]
        [else (combine-bst (insert-bst bst1 (node-key bst2)) (delete-bst bst2 (node-key bst2)))]))


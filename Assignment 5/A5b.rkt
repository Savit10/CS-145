;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname A5b) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct node (left right key))

(define (tree-height tree)
  (cond
    ((empty? tree) 0)
    (true (+ 1 (max (tree-height (node-left tree)) (tree-height (node-right tree)))))))

(define (count t)
  (cond [(empty? t ) 0]
        [else (+ 1 (count (node-left t))
                 (count(node-right t)))]))

(define (full? t)
  (if (empty? t) true (= (count t) (sub1 (expt 2 (tree-height t))))))

(define (balanced? t)
  (cond
    [(empty? t) #t]
    [else (and (balanced? (node-left t))
               (balanced? (node-right t))
               (<= (abs (- (count (node-left t)) (count (node-right t)))) 1))]))




;(if (empty? (node-left t)) (bst->list (node-right t))
          ;(if (empty? (node-right t)) (bst->list (node-left t))
;(if (empty? (node-right t)) (append (bst->list (node-left t)))
              ;(append (bst->list (node-left t)) (list (node-key t)) (list(bst->list (node-right t)))))))))                            
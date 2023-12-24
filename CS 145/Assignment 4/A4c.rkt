;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname A4c) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (tree-count n)
  (cond
    ((= n 0) 1)
    (else (/ (fac (* 2 n) 1) (* (fac n 1) (fac (+ n 1) 1))))))

(define (fac n m)
  (if (= n 1) m
      (fac (- n 1) (* n m))))

(define tree1 empty)
(define tree2 (insert-bst tree1 7))
(define tree3 (insert-bst tree2 3))
(define tree4 (insert-bst tree3 2))

(define tree5 empty)
(define tree6 (insert-bst tree5 6))
(define tree7 (insert-bst tree6 5))
(define tree8 (insert-bst tree7 9))
tree4
tree8
(combine-bst tree4 tree8)
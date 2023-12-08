;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname A6f) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require "avl-cs145.rkt")

(define-struct set (tree))

;Emptyset function that simply sets an emptyset to be empty, O(1) running time
(define emptyset empty)

;emptyset? function: checks if a set s is empty, O(1) running time
(define (emptyset? s)
  (empty? s))

;singleton: creates a set with a number n, O(1) running time
(define (singleton n)
  (insertavl empty n))

;union: creates a union set of two sets s1 s2 by inserting common elements of both s1 and s2 into s1 and deleting them from s2
;(insertavl takes care of the duplicates)
;O((logN)^2) running time -> insertavl and deleteavl are used, which are both O(log N) running time, and this is less than the required running time
(define (union s1 s2)
  (cond
    [(empty? s2) s1]
    [(empty? s1) s2]
    [(< (size s2) (size s1)) (union (insertavl s1 (node-key s2)) (deleteavl s2 (node-key s2)))]
    [else (union (insertavl s2 (node-key s1)) (deleteavl s1 (node-key s1)))]))

; Intersection with Intersection Helper Function: returns a set s3 that contains the common elements in both s1 and s2.
; This function uses the feature that if the element already exists in the set, inserting that element in the set will just return the set.
; By comparing the size between s2 and s2 after inserting (node-key s1), if there is no change, that suggests that (node-key s1) is already in s2, and is common in both sets.
; Therefore, the function will add that element to s3 and remove it from s1 so it is not checked again.
; If it's not in both sets, it will delete it from s1 and use recrursion to iterate through the rest of the set.

; Running Time: O((log N)^2): This is the running time since, similar to the previous function, we are using insertavl and deleteavl, which are both O(logN) running time
(define (intersection s1 s2)
  (cond
    [(> (size s1) (size s2)) (intersection-help s2 s1 '())]
    [true (intersection-help s1 s2 '())]))

(define (intersection-help s1 s2 s3)
  (cond
   [(or (empty? s1) (empty? s2)) s3]
   [(equal? (size s2) (size (insertavl s2 (node-key s1)))) (intersection-help (deleteavl s1 (node-key s1)) s2 (insertavl s3 (node-key s1)))]
   [else (intersection-help (deleteavl s1 (node-key s1)) s2 s3)]))

; Difference with Difference Helper: The logical is similar to the intersection, expect if the elements are common than it deletes it and if they are not common,
; then only does it add to s3 and if it's not common, then it adds it to s3 along with removing it from s1
;  Running Time: O((log N)^2): This is the running time since, similar to the previous function, we are using insertavl and deleteavl, which are both O(logN) running time
(define (difference s1 s2)
  (if (>= (size s1) (size s2)) (difference-help s2 s1 empty) (difference-help s1 s2 empty)))

(define (difference-help s1 s2 s3)
  (cond
    [(empty? s1) s3]
    [(equal? (size s2) (size (insertavl s2 (node-key s1)))) (difference-help (deleteavl s1 (node-key s1)) s2 s3)]
    [else (difference-help (deleteavl s1 (node-key s1)) s2 (insertavl s3 (node-key s1)))]))

; Size Function: Finds the size of a set using the sizeavl function.
; Running Time: O(1) -> since sizeavl is O(1), this has to also be O(1)
(define (size s)
  (sizeavl s))

; Nth with Nth helper Function: This function finds the nth element in a set. It does this by traversing the left and right subtrees and if the i-value equals the size of the
; left subtree + counter (accumulator of the size), that value will be the nth element in the set and will be returned.
; Running Time: O(log N) -> This algorithm is as efficient as traversing a balanced AVL tree, which is O(log N) efficient

(define (nth s i)
  (nth-help s i 0))

(define (nth-help s i counter)
  (cond
    [(= i (+ (size (node-left s)) counter)) (node-key s)]
    [(< i (+ counter (size (node-left s)))) (nth-help (node-left s) i counter)]
    [else (nth-help (node-right s) i (+ 1 counter (size (node-left s))))]))
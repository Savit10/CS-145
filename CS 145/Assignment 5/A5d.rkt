;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname A5d) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct node (left right key))

(define (list->balanced 1st)
  (if (empty? 1st) '()
     (if (not (list? 1st)) (make-node '() '() 1st)
         (if (empty? (cdr 1st)) (make-node '() '() (car 1st)) 
             (make-node (list->balanced(take 1st (quotient (length 1st) 2))) (list->balanced (drop 1st (+ 1(quotient (length 1st) 2)))) (first (drop 1st (quotient (length 1st) 2))))))))
             
(define (take 1st n)
  (cond
    [(or (empty? 1st) (< n 1)) empty]
    [else (if (> n 0) (cons (car 1st) (take (cdr 1st) (- n 1))) 1st)]))
  
(define (drop 1st n)
  (cond
    [(or (empty? 1st) (<= n 0)) 1st]
    [else (drop (cdr 1st) (- n 1))]))


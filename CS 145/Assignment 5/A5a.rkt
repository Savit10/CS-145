;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname A5a) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct node (left right key))

(define (take 1st n)
  (cond
    [(or (empty? 1st) (< n 1)) empty]
    [else (cons (car 1st) (take (cdr 1st) (- n 1)))]))
  
(define (drop 1st n)
  (cond
    [(or (empty? 1st) (< n 1)) 1st]
    [else (drop (cdr 1st) (- n 1))]))


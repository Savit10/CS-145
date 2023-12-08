;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname A5c) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct node (left right key))

(define (bst->list t)
  (in-order t '()))

(define (in-order t acc)
  (if (empty? t) acc
      (in-order (node-left t) (cons (node-key t) (in-order (node-right t) acc)))))


;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname tutorial) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
((lambda (x y) (- x y)) 3 2)
(((lambda (x) (lambda (y) (- x y))) 2)3)

; Abstract-list funcitons in-built: map, build-list, foldr, foldl
; (map fn list) -> applied a function fn to each element of the list

(define (my-map function lst)
  (cond
    [(empty? lst) empty]
    [else (cons(function (first lst))
               (my-map function (rest lst)))])) 
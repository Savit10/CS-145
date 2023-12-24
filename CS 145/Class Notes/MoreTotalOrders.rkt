#lang racket

; more total orders

(define lst (build-list 20 (lambda(x) (- (random 21) 10))))

(define-struct node (l k r))

(define (bins e t <)
  (cond
    [(empty? t) (make-node empty e empty)]
    [(< e (node-k t)) (make-node (bins e (node-l t) <) (node-k t) (node-r t))]
    [(< (node-k t) e) (make-node (node-l t) (node-k t) (bins e (node-r t) <))]
    [true t]))

(define (blist t)
  (cond
    [(empty? t) empty]
    [(append (blist (node-l t)) (list (node-k t)) (blist (node-r t)))]))

lst
(sort lst <)
(sort lst >)
(define mag (lambda (a b)
            (cond
              [(< (sqr a) (sqr b)) true]
              [(< (sqr b) (sqr a)) false]
              ;[(< b a) true]
              [true false])))

(blist (foldl (lambda (e t) (bins e t <)) empty lst))
(blist (foldl (lambda (e t) (bins e t mag)) empty lst))
(blist (foldl (lambda (e t) (bins e t symbol<?)) empty (list 'fred 'wilma 'betty 'pebbles)))
(blist (foldl (lambda (e t) (bins e t string<?)) empty (list "fred" "wilma" "betty" "pebbles" "wilma")))                                                          
(blist (foldl (lambda (e t) (bins e t string<?)) empty (list "fred" "wilma" "betty" "pebbles" "Wilma")))
(blist (foldl (lambda (e t) (bins e t string-ci<?)) empty (list "fred" "wilma" "betty" "pebbles" "Wilma"))) 
(blist (foldl (lambda (e t) (bins e t string-ci<?)) empty (list "fred" "Wilma" "betty" "pebbles" "wilma")))

(define 1lst (build-list 10 (lambda (x) (build-list (random 4) (lambda (y) (random 10))))))

(define (lex<? a b)
  (cond
    [(empty? b) false]
    [(empty? a) true]
    [(< (car a) (car b)) true]
    [(< (car b) (car a)) false]
    [true (lex<? (cdr a) (cdr b))]))

(blist (foldl (lambda (e t) (bins e t lex<?)) empty 1lst))
(string->list "Wilma")
(car (string->list "Wilma"))
(char->integer (car (string->list "Wilma")))
(integer->char 955)

#lang racket

(require "stream.rkt")
(provide stream-map)

(define (stream-map fn s)
  (stream-generate
   s
   (lambda (x) (stream-empty? x))
   (lambda (x) (stream-cdr x))
   (lambda (x) (fn (stream-car x)))))
#lang racket
(require "CPU.rkt")
(require "RAM.rkt")

(define accum
  (list
     0   ; [0]: first instruction
     0   ; [1]: n
     0   ; [2]: acc
     80100 ; input n
     40001 ; skip next if n = 0
     10002 ; skip next 2 instructions
     70002 ; out acc
     90000 ; halt
     10201 ; acc = acc + n
     70002
     ))
(void (cpu (ram-load ram 0 accum) 0))         
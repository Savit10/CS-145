#lang racket
(require "cpu.rkt")
(require "RAM.rkt")

(define accum
  '(
    6     ; [0]: first instruction
    1     ; [1]: literal 1
    2     ; [2]: literal 2
    8    ;  [3]: literal 8
    0     ; [4]: n
    0     ; [5]: acc
    80400 ; [6] input n into [4]
    10504 ; [7] acc = acc + n 
    40004 ; [8] skip next if n = 0
    70005 ; [9] out acc
    40004 ; [10] skip next if n = 0
    10001 ; [11] skip next instruction
    90000 ; [12] halt
    20003 ; [13] go back 8
     ))
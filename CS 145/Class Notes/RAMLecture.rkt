#lang racket

#|
Random Access Memory/Model/Machine
- Model of Computation (like Lambda Calculus, Turing Machine...)
- Two aspects: Racket and Physical (Electronic)

Random Access Memory - An Abstract Data Type
Operations:
      Create New RAM
RAM<- RAM-Store[RAM, Address(non-negative integer), Value(non-negative integer)]
Value <- RAM-Fetch/Load [RAM, Address]

RAM-Load[RAM, Address with no value] -> Will return an error
RAM-Store[RAM, Address with already Existing Value, New Value] -> Will replace the existing value

Generate - hardwired into fetching the instructions from the RAM
- Accumulator is RAM
- Step Function O(1)
   - Small # Primitive Operations
- Need an Input Stream
- Need an Output Stream |#

(require "RAM.rkt")

(define r ram)

(define r1 (ram-store r 1 42))
(define r2 (ram-store r1 99 25))
(define r3 (ram-store r2 99 55))

(ram-fetch r3 1)
(ram-fetch r3 99)

(core-dump r3)

#|
RAM Computation
- numbers: choose RAM Location
|#


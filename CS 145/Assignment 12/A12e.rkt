#lang racket
(require "cpu.rkt")
(require "RAM.rkt")

(define accum
  '(
    18    ; [0]: first instruction
    1     ; [1]: literal 1
    2     ; [2]: literal 2
    15    ; [3]: literal 8
    9     ; [4]: literal 7
    31    ; [5]: literal 26
    4     ; [6]: literal 3
    30    ; [7]: literal 22
    60    ; [8]: literal 60
    0     ; [9]: n
    0     ; [10]: acc
    0     ; [11]: length of the list
    0     ; [12]: count of what element is being checked
    55    ; [13]: address to sub value at index from count address from n
    56    ; [14]: address to sub n and value at index from count address
    61    ; [15]: count increment
    61    ; [16]: count subtraction
    60    ; [17]: literal 60
    
    80900 ; [18]: input n into [9]

    ;; empty inp condition
    40009 ; [19] skip next if n = 0
    10001 ; [20] skip next instruction
    90000 ; [21] halt
    
    ;; count = 0 condition statement
    40012 ; [22]: skip next if count = 0
    10004 ; [23]: skip next 9 instructions
    11611 ; [24]: add the current length of the list to the index to start
    61609 ; [25]: add the element to the RAM
    31615 ; [26]: refresh the last index locator as the length of the list
    11101 ; [27]: length = length + 1
    31211 ; [28]: count = length of list
    11009 ; [29] acc = acc + n
    30817 ; [30] refresh 60 + length to 60
    70010 ; [31] output acc
    20003 ; [32]: go back 15 instructions (ask for new n)
    ;; = n value(count)

    10812 ; [33]: 60 + count
    31208 ; [34]: count = 60 + length
    55512 ; [35]: storing the value at index count in address 55
    35609 ; [36]: storing n at address 56
    35755 ; [37]: copy 55 to 57
    35856 ; [38]: copy 56 to 58
    25855 ; [39]: old value - new value
    25756 ; [40]: new value - odd value
    40058 ; [41]: skip next if value at address 58 is 0
    10001 ; [42]: skip next
    40057 ; [43]: skip next if value at address 57 is 0
    10006 ; [44]: skip next 4 instructions
    30817 ; [45]: refresh 8 to 60
    70010 ; [46]: output acc
    31211 ; [47]: count = length of list
    20005 ; [48]: go back 26 instructions

    ;; n != count

    21215 ; [49]: sub 61 from count
    30817 ; [50] refresh 60 + length to 60
    20007 ; [51]: go back 30 instructions
   
     ))
;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Compound Data Teaser|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Teaser of Compound Data
(define x (make-posn (+ 1 2 3) (+ 4 5 6))); Called a structure, meant for cartesian coordinates

(define y (make-posn 'foo 'bar))

(define floop (make-posn x y))

; posn is just a special case of define-struct

(define-struct flinstone (fred wilma))
(define bedrock (make-flinstone 'barney 'betty))

; make-flinstone: constructor
; flinstone-fred, finlinstone-wilma -- selectors
; flinstone? -- predicate

; distance between coordinates
(define (dist a b)(sqrt(+(sqr(-(posn-x a)(posn-x b))) (sqr(-(posn-y a)(posn-y b))))))

;--------------------------------------------------------------------------------------------------------------------
; bunch of numbers - no preset limit on size of numbers, 0 or more numbers are in a bunch
; bunch of zero numbers - empty or '() --> new type of data 
; bunch of one numbers - a
; bunch of two numbers - (make-posn a b) or (make-posn b a) - ordering of numbers/posn's doesn't matter
; bunch of three numbers - (make-posn a (make-posn b c)) or (make-posn (make-posn a b) c)
; bunch of n >= 3 numbers - (make-posn (X Y)) where X and Y are bunches such that size of X < n and size of Y < n and elements contained in X union the elements contained in Y = original elements
; or, for example (make-posn a1, Y) where Y is implementation of a2 to aN

;--------
; Operations with a bunch of numbers
; size: # of numbers
; size of (X union Y) = size of X + size of Y
; bunchadd ( bunch + number ) = (bunch number)
; bunchcombine (bunch + bunch) = (bunch bunch)

(define bunch-empty empty)
(define (bunch-single e) e)
(define (bunch-add b e)
  (if (empty? b) e (make-posn e b)))
(define (bunch-add-alt b e)
  (if (empty? b) e (make-posn b e)))

(define (bunch-size b)
  (cond
        [(empty? b) 0]
        [(number? b) 1]
        [true (+(bunch-size (posn-x b)) (bunch-size (posn-y b)))]))

(define (bunch-sum b)
  (cond
    [(empty? b) 0]
    [(number? b) b]
    [true (+ (bunch-sum(posn-x b) (bunch-sum(posn-y b))))]))

(define b0 bunch-empty)
(define b1 (bunch-add b0 33))
(define b2 (bunch-add b1 66))
(define b3 (bunch-add b2 77))

(define (bunch-combine a b)
  (cond
    [(empty? a) b]
    [(empty? b) a]
    [true (make-posn a b)]))

(define (bunch-rem b e)
  (cond
    [(empty? b) b]
    [(number? b) (if (= b e) bunch-empty b)]
    [true (bunch-combine(bunch-rem (posn-x b) e) (bunch-rem (posn-y b) e))]))

; bunch-product, change empty value to 1 and multiply
; bunch-max, change empty value to -infinity and create own max function to apply
; bunch-count-element(b, e) if size b = 0, return 0. else if size b = 1, return 0 if b != e and 1 if b = e. else return bce(a, e) + bce (a,e)
; bunch-member? [b e] (bce[b, e] > 0)

;bunch remove-all of element BRA[b, e]
; BRA [empty, e] = empty
; BRA[n, n] = empty
; BRA((a,b), n) = ???

; if (posn-x a) = empty, return (posn-y a)
; if (posn-x b) = empty, return (posn-y a)

; Combine Bunches (B[a,b]) if (B = empty) A (if (A = empty) B ) recursively pass through the bunch (a != 0, b!= 0)



#! /usr/bin/env gosh
; Problem 1 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=1

(define (summul1 n x)
    (/ (* x (quotient n x) (+ 1 (quotient n x)))
        2))

(define (summul2 n x y)
    (- (+ (summul1 n x) (summul1 n y))
        (summul1 n (* x y))))

(display (summul2 999 3 5))

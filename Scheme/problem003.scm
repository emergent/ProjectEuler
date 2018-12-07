#! /usr/bin/env gosh
; Problem 3 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=3
(define (maxprimefactor x p)
    (if (< p x)
        (if (zero? (mod x p))
            (maxprimefactor (quotient x p) p)
            (maxprimefactor x (+ p 2)))
        x))

(display (maxprimefactor 600851475143 3))

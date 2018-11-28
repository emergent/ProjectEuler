;#! /usr/bin/env gosh
; Problem 2 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=2

(define (fibmax2 x xs)
    (let ((n (+ (car xs) (car (cdr xs)))))
        (if (< x n)
            xs
            (fibmax2 x (cons n xs)))))

(define (fibmax x)
    (cond
        ((= x 1) '(1))
        ((= x 2) '(1 2))
        (else (reverse (fibmax2 x '(2 1))))))

(define (fibevensum x)
    (reduce + 0 (filter even? (fibmax x))))

(display (fibevensum 4000000))

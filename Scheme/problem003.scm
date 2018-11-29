#! /usr/bin/env gosh
; Problem 3 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=3

(define (sieve n max ls)
    (let ((k (list-ref ls n)))
        (if (> k max)
            ls
            (sieve (+ n 1)
                    max
                    (filter (lambda (x) 
                                (or (= x k)
                                    (not (= (mod x k) 0))))
                            ls)))))

(define (primes x)
    (cond
        ((<= x 1) '())
        ((=  x 2) '(2))
        ((>  x 2) (cons 2 
                        (sieve 0 (sqrt x)
                            (iota (quotient (x->integer (- (+ x 1) 3)) 1) 2))))))

(define (maxprimefactor2 x ps)
    (if (null? ps)
        x
        (if (zero? (mod x (car ps)))
            (let ((qx (quotient x (car ps))))
                (if (= qx 1)
                    x
                    (maxprimefactor2 qx ps)))
            (maxprimefactor2 x (cdr ps)))))

(define (maxprimefactor x)
    (x->integer (maxprimefactor2 x (primes (sqrt x)))))

(display (maxprimefactor 600851475143))

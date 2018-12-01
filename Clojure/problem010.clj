#! /usr/bin/env clojure
; Problem 10 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=10

(require '[mathtools :refer [primes]])
(println (reduce + (primes 2000000)))

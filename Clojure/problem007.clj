#! /usr/bin/env clojure
; Problem 7 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=007

(require '[mathtools :refer [primes]])

(-> (primes 1000000)
    (nth (dec 10001))
    (println))

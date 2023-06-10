#! /usr/bin/env clojure
; Problem 24 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=024

(require '[clojure.math.combinatorics :as combo]
         '[clojure.string :as string])

(-> (range 10)
    (combo/nth-permutation (dec 1000000))
    (clojure.string/join)
    (println))

#! /usr/bin/env clojure
; Problem 29 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=029

(require '[mathtools :refer [power]])
(-> (for [a (range 2 (inc 100))
          b (range 2 (inc 100))]
      (power a b))
    (distinct)
    (count)
    (println))

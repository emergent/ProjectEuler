#! /usr/bin/env clojure
; Problem 5 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=005
(require '[mathtools :refer [lcm]])

(->> (range 1 (inc 20))
     (reduce lcm)
     (println))

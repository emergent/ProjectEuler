#! /usr/bin/env clojure
; Problem 6 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=006

(-> (range 1 (inc 100))
    (as-> x
          (let [sum (reduce + x)]
            (- (* sum sum) (reduce + (map #(* % %) x)))))
    (println))

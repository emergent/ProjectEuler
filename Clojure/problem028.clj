#! /usr/bin/env clojure
; Problem 28 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=028

(defn sum_diagonals_n_by_n_spiral [n]
  (->> (for [x (range 1 (inc n) 2)]
         (+ (int (* 4 (Math/pow x 2)))
            (* -6 x)
            6))
       (reduce +)
       (+ -3)))
              
(println (sum_diagonals_n_by_n_spiral 1001))

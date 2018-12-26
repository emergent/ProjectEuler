#! /usr/bin/env clojure
; Problem 2 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=2

(defn fibevensum [xmax]
  (loop [a 1 b 2 sum 0]
    (if (>= a xmax)
      sum
      (if (even? a)
        (recur b (+ a b) (+ sum a))
        (recur b (+ a b) sum)))))

(-> (fibevensum 4000000)
    (println))

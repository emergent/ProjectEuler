#! /usr/bin/env clojure
; Problem 46 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=46
(require '[mathtools :refer [primes]])

(let [N 10000
      ps (primes N)
      odd-composite-num (for [a (range 5 (inc N) 2)
                              :when (< (.indexOf ps a) 0)] a)]
  (loop [odds odd-composite-num]
    (let [odd (first odds)
          g (-> (for [sq (reverse (range 1 (inc (int (Math/sqrt (/ odd 2))))))
                      :let [i (- odd (* 2 (* sq sq)))]
                      :when (>= (.indexOf ps i) 0)] (list i odd))
                (first))]
      (if (nil? g)
        (println odd)
        (recur (rest odds))))))

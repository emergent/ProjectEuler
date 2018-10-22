#! /usr/bin/env clojure
; Problem 25 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=025

(defn fibodigits [maxdigits]
  (loop [a 1 b 1 i 1]
    (let [len (count (str a))]
      ;(println i a len)
      (if (>= len maxdigits)
        (list i a)
        (recur (bigint b) (bigint (+ a b)) (inc i))))))

(println (fibodigits 1000))

#! /usr/bin/env clojure
; Problem 5 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=005
(defn gcd [a b]
  (loop [m (max a b)
         n (min a b)]
    (if (zero? n)
      m
      (recur n (mod m n)))))

(defn lcm [a b]
  (/ (* a b)
     (gcd a b)))

(->> (range 1 (inc 20))
     (reduce lcm)
     (println))

#! /usr/bin/env clojure
; Problem 5 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=005
(defn gcd [a b]
  (loop [m (max a b)
         n (min a b)]
        (let [r (mod m n)]
          (if (zero? r)
            n
            (recur n r)))))

(defn lcm [a b]
  (/ (* a b)
     (gcd a b)))

(->> (range 1 (inc 20))
     (reduce lcm)
     (println))

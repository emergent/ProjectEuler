#! /usr/bin/env clojure
; Problem 3 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=3
(require '[mathtools :refer [primes]])

(defn maxprimefactor' [x ps]
  (if (empty? ps)
    x
    (if (zero? (mod x (first ps)))
      (let [qx (quot x (first ps))]
        (if (= qx 1)
          x
          (recur qx ps)))
      (recur x (rest ps)))))

(defn maxprimefactor [x]
  (int (maxprimefactor' x (primes (Math/sqrt x)))))

(println (maxprimefactor 600851475143N))

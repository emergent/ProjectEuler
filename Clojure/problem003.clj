#! /usr/bin/env boot
; Problem 3 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=3

(defn sieve [n max ls]
  (let [k (nth ls n)]
    (if (> k max)
      ls
      (recur (+ n 1)
             max
             (filter #(or (= % k) (not= (mod % k) 0)) ls)))))

(defn primes [x]
  (cond
    (<= x 1) '()
    (=  x 2) '(2)
    (>  x 2) (cons 2 (sieve 0 (Math/sqrt x) (range 3 (inc x) 2)))))

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

(defn -main []
  (println (maxprimefactor 600851475143N)))

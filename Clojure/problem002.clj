#! /usr/bin/env clojure
; Problem 2 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=2

(defn fibmax' [x xs]
  (let [n (+ (first xs) (second xs))]
    (if (< x n)
      xs
      (fibmax' x (cons n xs)))))

(defn fibmax [x]
  (cond
    (= x 1) '(1)
    (= x 2) '(1 2)
    :else (reverse (fibmax' x '(2 1)))))

(defn fibevensum [x]
  (reduce + (filter even? (fibmax x))))

(println (fibevensum 4000000))

#! /usr/bin/env clojure
; Problem 41 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=41

(require '[mathtools :refer [primes]])
(def primes10m (primes 10000000))
(def ndigit
  (memoize (fn [n] (set (range 1 (inc n))))))

(defn pandigital? [x]
  (let [strx (str x)]
    (= (set (map #(- (int %) 48) strx))
       (ndigit (count strx)))))

(defn pppp [s]
  (do (println "---tsuuka---") s))

(->> primes10m
     (filter pandigital?)
     (apply max)
     (println))

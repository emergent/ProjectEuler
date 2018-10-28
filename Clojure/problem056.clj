#! /usr/bin/env clojure
; Problem 56 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=056

(defn power [a b]
  (reduce *' (repeat b a)))

(defn dec2list [x]
  (map #(Integer/parseInt %)
       (-> (str x)
           (clojure.string/split #""))))

(defn digitalsum [x]
  (reduce + (dec2list x)))

(->> (for [x (range 100)
           y (range 100)]
       (power x y))
     (map digitalsum)
     (apply max)
     (println))

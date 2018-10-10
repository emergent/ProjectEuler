#! /usr/bin/env clojure
; Problem 16 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=016

(defn power [a b]
  (reduce *' (repeat b a)))

(->> (-> (power 2 1000)
         (str)
         (clojure.string/split #""))
     (map #(Integer/parseInt %))
     (reduce +)
     (println))

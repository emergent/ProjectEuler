#! /usr/bin/env clojure
; Problem 20 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=020

(require '[clojure.string :refer [split]])

(->> (-> (->> (range 1 (inc 100))
              (reduce *'))
         (str)
         (split #""))
     (map #(Integer/parseInt %))
     (reduce +)
     (println))


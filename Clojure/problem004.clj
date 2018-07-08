#! /usr/bin/env boot
; Problem 4 - Project Euler
; 
; A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
; Find the largest palindrome made from the product of two 3-digit numbers.
; 
; http://projecteuler.net/index.php?section=problems&id=4

(defn palindromic? [x]
  (let [s (str x)]
    (= s (clojure.string/join (reverse s)))))

(defn -main []
  (println 
    (->> (range 100 (inc 999))
         (map #(map (fn [x] (* x %)) (range 100 (inc %))))
         (flatten)
         (distinct)
         (filter palindromic?)
         (apply max)
         )))

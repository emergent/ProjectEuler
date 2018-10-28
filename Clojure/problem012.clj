#! /usr/bin/env clojure
; Problem 12 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=012

(defn trinum [i]
  (int (/ (* (inc i) (+ i 2))
          2)))

(defn countdivisors [x]
  (->> (range 1 (inc (Math/floor (Math/sqrt x))))
       (filter #(zero? (mod x %)))
       (map #(list % (quot x %)))
       (flatten)
       (distinct)
       (count)
       (list x)))

(->> (range)
     (map trinum)
     (map countdivisors)
     (filter #(> (second %) 500))
     (first)
     (println))

#! /usr/bin/env clojure
; Problem 23 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=023

(defn divisors [x]
  (->> (range 1 (inc (int (Math/sqrt x))))
       (filter #(zero? (mod x %)))
       (map #(list % (quot x %)))
       flatten
       distinct
       sort))

(defn abundant? [x]
  (< x (- (reduce + (divisors x)) x)))

(defn abundants [x]
  (->> (range 1 (inc x))
       (filter abundant?)))

(defn sumoftwo [coll limit]
  (let [n (count coll)]
    (->> (for [i (range 0 n)
               j (range i n)
               :let [x (nth coll i)
                     y (nth coll j)
                     z (+ x y)]
               :when (< z limit)]
           z)
         sort
         distinct
         (reduce +))))

(println
 (let [limit 28123]
   (- (reduce + (range 1 limit))
      (sumoftwo (abundants limit) limit))))

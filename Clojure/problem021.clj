#! /usr/bin/env clojure
; Problem 21 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=021

(defn devisors [x]
  (->> (range 1 (inc (int (Math/sqrt x))))
       (filter #(zero? (mod x %)))
       (map #(list % (quot x %)))
       (flatten)
       (distinct)
       (sort)))

(defn d [x]
  (- (reduce + (devisors x)) x))

(defn amicable-pair [x]
  (let [dx (d x)]
    (if (and (< x 10000) (not= x dx) (= x (d dx)))
      (list x dx)
      nil)))

(-> (for [i (range 1 10000)
          :let [ap (amicable-pair i)]
          :when (not (nil? ap))]
      (sort ap))
    (distinct)
    (as-> x (do (println x) x))
    (flatten)
    (as-> ans (reduce + ans) (println ans)))

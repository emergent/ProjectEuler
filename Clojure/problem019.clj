#! /usr/bin/env clojure
; Problem 19 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=19

(defn leap? [year]
  (letfn [(mod-zero? [x d] (zero? (mod x d)))]
    (or (mod-zero? year 400)
        (and (not (mod-zero? year 100))
             (mod-zero? year 4)))))

(defn days-of-year [year]
  (if (leap? year) 366 365))

(defn days-of-months [year]
  (if (leap? year)
    '(31 29 31 30 31 30 31 31 30 31 30 31)
    '(31 28 31 30 31 30 31 31 30 31 30 31)))

(defn amount-days [y m d]
    (->> (range 1901 y)
         (map days-of-year)
         (reduce +)
         (+ (reduce + (take (dec m) (days-of-months y))))
         (+ (dec d))))

(defn sunday? [amount]
  (= (mod amount 7) 5))

(->> (for [y (range 1901 (inc 2000))
           m (range 1 (inc 12))]
       (amount-days y m 1))
     (filter sunday?)
     (count)
     (println))

#! /usr/bin/env clojure
; Problem 36 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=36
(require '[clojure.string :as s])

(defn palindromic10? [x]
  (let [strx (str x)]
    (= strx (s/reverse strx))))

(defn palindromicbin? [x]
  (let [binx (Integer/toBinaryString x)]
       (= binx (s/reverse binx))))

(defn palindromic2bases? [x]
  (and (palindromic10? x) (palindromicbin? x)))

(->> (range 1 1000000)
     (filter palindromic2bases?)
     (reduce +)
     (println))


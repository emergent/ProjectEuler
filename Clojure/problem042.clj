#! /usr/bin/env clojure
; Problem 42 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=042
(defn triangle-numbers [nmax]
  (for [i (range 1 nmax)]
    (/ (* i (inc i))
       2)))

(defn char2score [c]
  (- (int c) 64))

(defn alphabetical-score [word]
  (->> (seq word)
       (filter #(not= % \"))
       (map char2score)
       (reduce +)))

(def tns (triangle-numbers 100))
(->> (-> (slurp "data/p042_words.txt")
         (clojure.string/split #","))
     (map alphabetical-score)
     (filter #(>= (.indexOf tns %) 0))
     (count)
     (println))

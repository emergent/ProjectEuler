#! /usr/bin/env clojure
; Problem 4 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=4

(defn palindromic? [x]
  (let [s (str x)]
    (= s (clojure.string/join (reverse s)))))

(->> (range 100 (inc 999))
    (map #(map (fn [x] (* x %)) (range 100 (inc %))))
    (flatten)
    (distinct)
    (filter palindromic?)
    (apply max)
    (println)
)

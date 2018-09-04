#! /usr/bin/env boot
; Problem 4 - Project Euler
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

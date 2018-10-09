#! /usr/bin/env clojure
; Problem 15 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=015

(defn factorial [x]
  (reduce *' (range 1 (inc x))))

(let [m 40
      n 20]
  (println (long
    (/ (/ (factorial m) (factorial (- m n)))
       (factorial n)))))

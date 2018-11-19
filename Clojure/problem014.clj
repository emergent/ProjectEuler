#! /usr/bin/env clojure
; Problem 14 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=014

(defn chain' [n i]
  (if (= n 1)
    i
    (if (even? n)
      (recur (/ n 2) (inc i))
      (recur (inc (* 3 n)) (inc i)))))

(defn chain [n]
  (list n (chain' n 1)))

(->> (range 2 1000000)
     (map chain)
     (apply max-key #(second %))
     (println))

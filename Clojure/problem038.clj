#! /usr/bin/env clojure
; Problem 38 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=38

(def digits (set (range 1 10)))
(defn pandigital-9-digits [x]
  (let [setx (->> (str x)
                  (map #(- (int %) 48))
                  (set))]
    (= setx digits)))

(->> (range 9183 10000)
     (map #(Integer/parseInt (str % (* % 2))))
     (filter pandigital-9-digits)
     (apply max)
     (println))


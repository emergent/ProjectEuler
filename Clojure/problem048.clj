#! /usr/bin/env clojure
; Problem 48 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=048

(def nn10 10000000000)
(defn addmod [x y] (mod (+ x y) nn10))
(defn mulmod [x y] (mod (* x y) nn10))
(defn selfpower [x]
  (reduce mulmod (repeat x x)))

(-> (->> (range 1 (inc 1000))
         (map selfpower)
         (reduce addmod))
    (println))

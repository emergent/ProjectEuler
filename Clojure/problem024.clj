#! /usr/bin/env clojure
; Problem 24 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=024

(require '[mathtools :refer [dec2list factorial]])

(defn str0add [x]
  (let [s (dec2list x)]
    (if (< (count s) 10)
      (cons 0 s)
      s)))

(defn has-no-dup-digit [x]
  (let [s (str0add x)]
       (if (= (count s) (count (distinct s)))
         x
         nil)))

; precomputed:
; 8! = 40320
;  1000000 / 40320 => 24(quot)
;  25th top-2-value is 27
(-> (range 2701345689 (inc 2897654310))
    (as-> x
          (keep has-no-dup-digit x))
    (nth (- (dec 1000000) (* 24 (factorial 8))))
    (println))

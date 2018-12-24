#! /usr/bin/env clojure
; Problem 44 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=44
(defn penta [n]
  (/ (* n (dec (* 3 n))) 2))

(let [pentas (map penta (range 1 3000))]
  (->> pentas
       (map-indexed
        #(for [x (range 1 (inc %))
               :let [px (penta x)]
               :when (and (>= (.indexOf pentas (+ %2 px)) 0)
                          (>= (.indexOf pentas (- %2 px)) 0))]
           (- %2 px)))
       (filter not-empty)
       (flatten)
       (apply min)
       (println)))

#! /usr/bin/env clojure
; Problem 22 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=22
(require '[clojure.string :as s])

(def names (-> (slurp "data/p022_names.txt")
               (s/replace #"\"" "")
               (s/upper-case)
               (s/split #",")
               (sort)))

(defn count-score [name]
  (letfn [(c2i [c] (- (int c) 64))]
    (->> (vec name)
         (map c2i)
         (reduce +))))

(->> names
     (map-indexed #(* (inc %) (count-score %2)))
     (reduce +)
     (println))

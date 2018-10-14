#! /usr/bin/env clojure
; Problem 30 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=030
(require '[clojure.string :refer [split]])

(defn pp [s]
  (do
    (println s)
    s))

(defn sum-digits-power [x, p]
  (->> (-> (str x)
           (split #""))
       (map #(int (Math/pow (Integer/parseInt %) p)))
;       (pp)
       (reduce +)))

(-> (for [i (range 2 354294)
          :when (= i (sum-digits-power i 5))]
      i)
    (as-> ans
          (println (reduce + ans) ans)))

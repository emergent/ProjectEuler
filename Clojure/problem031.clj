#! /usr/bin/env clojure
; Problem 31 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=031

(defn coin-patterns [restcoins coins pattern]
  (if (and (= (count coins) 1)
           (= (first coins) 1))
    (-> (conj pattern restcoins)
        (list))
    (->> (let [n (quot restcoins (first coins))]
           (for [i (range 0 (inc n))]
             (coin-patterns (- restcoins
                               (* i (first coins)))
                            (rest coins)
                            (conj pattern i))))
         (reduce concat))))

(def coins '(200 100 50 20 10 5 2 1))
(-> (coin-patterns 200 coins '())
    (as-> ans
          (println (count ans))))

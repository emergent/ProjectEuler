#! /usr/bin/env clojure
; Problem 32 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=32

(require '[clojure.string :as s])
(require '[mathtools :refer [ppp]])
(defn pandigitalproducts [st]
  (let [prod (Integer/parseInt (s/join (nthnext st 5)))]
       (loop [i 1]
         (if (= i 4)
           nil
           (let [m1 (Integer/parseInt (s/join (take i st)))
                 m2 (Integer/parseInt (s/join (take (- 5 i)
                                                    (nthnext st i))))]
             (if (= (* m1 m2) prod)
               ;(list m1 m2 prod)
               prod
               (recur (inc i))))))))

(def permutations
  (->> (range 123456789 (inc 987654321))
       (filter #(< (.indexOf (str %) "0") 0))
       (filter #(= (count (str %))
                   (count (distinct (str %)))))
       (map str)))

(->> permutations
     (keep pandigitalproducts)
     (ppp)
     (distinct)
     (reduce +)
     (println))

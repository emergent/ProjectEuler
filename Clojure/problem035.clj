#! /usr/bin/env clojure
; Problem 35 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=35

(require '[mathtools :refer [primes]])
(require '[clojure.string :as s])
(def prime-million (primes 1000000))

(defn rotate1 [s]
  (let [f (first s)
        r (rest  s)]
       (-> (concat r (list f))
           (s/join))))

(defn circular-prime? [x]
  (loop [s (rotate1 (str x))]
    ;(println (list s x))
    (if (= (Integer/parseInt s) x)
      true
      (if (< (.indexOf prime-million (Integer/parseInt s)) 0)
        false
        (recur (rotate1 s))))))
  
(->> prime-million
     (filter circular-prime?)
     (count)
     (println))

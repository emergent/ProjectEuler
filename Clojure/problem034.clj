#! /usr/bin/env clojure
; Problem 34 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=034
(require '[clojure.string :refer [split]])

(defn factorial [x]
  (if (zero? x)
    1
    (* x (factorial (dec x)))))

(defn digitfact [x]
  (->> (-> (str x)
           (split #""))
       (map #(Integer/parseInt %))
       (map factorial)
       (reduce +)
       (= x)))

(defn ppp [str]
  (do (println str) str))

(->> (range 3 10000000)
     (filter digitfact)
     (ppp)
     (reduce +)
     (println))

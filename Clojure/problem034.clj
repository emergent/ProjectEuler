#! /usr/bin/env clojure
; Problem 34 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=034

(defn dec2list [x]
  (map #(Integer/parseInt %)
       (-> (str x)
           (clojure.string/split #""))))

(defn factorial [x]
  (if (zero? x)
    1
    (* x (factorial (dec x)))))

(defn digitfact [x]
  (->> (dec2list x)
       (map factorial)
       (reduce +)
       (= x)))

(->> (range 3 10000000)
     (filter digitfact)
     (reduce +)
     (println))

#! /usr/bin/env clojure
; Problem 27 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=027

(require '[mathtools :refer [primes ppp]])

(def primes100m (primes 1000000))

(defn prime-counter [a b]
  (loop [n 0 c 0]
    (let [p (+ (* n n) (* a n) b)]
      (if (< (.indexOf primes100m (Math/abs p)) 0)
        (list a b c)
        (recur (inc n) (inc c))))))

(->> (for [a (range -999 1000)
           b (primes 1000)
           :let  [z (prime-counter a b)]
           :when (> (nth z 2) 2)]
       z)
     (apply max-key #(nth % 2))
     (ppp)
     (take 2)
     (reduce *)
     (println))
    


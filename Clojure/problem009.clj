#! /usr/bin/env clojure
; Problem 9 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=009
(defn triplet [b c]
  (let [a (int (Math/sqrt (- (* c c) (* b b))))]
    (if (= (+ (* a a) (* b b))
           (* c c))
      (list a b c)
      nil)))

(defn pythagorean-triplet [x]
  (->> (range 1 x)
       (keep #(triplet % x))))

(defn divquot [ls p]
  (let [sum (reduce + ls)]
    (if (zero? (mod p sum))
      (let [m (quot p sum)]
        (map #(* % m) ls))
      nil)))
  
(loop [n 6
       p 1000]
  (let [t (->> (pythagorean-triplet n)
               (keep #(divquot % p)))]
    (if (not-empty t)
      (-> (first t)
          (as-> xs
                (do
                  (println xs)
                  (println (reduce * xs)))))
      (recur (inc n) p))))

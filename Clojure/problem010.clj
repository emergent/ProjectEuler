#! /usr/bin/env boot
; Problem 10 - Project Euler
; 
; The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
; Find the sum of all the primes below two million.
;
; http://projecteuler.net/index.php?section=problems&id=10

(defn sieve [n max ls]
  (let [k (nth ls n)]
    (if (> k max)
      ls
      (recur (+ n 1)
             max
             (filter #(or (= % k) (not= (mod % k) 0)) ls)))))

(defn primes [x]
  (cond
    (<= x 1) '()
    (=  x 2) '(2)
    (>  x 2) (cons 2 (sieve 0 (Math/sqrt x) (range 3 (inc x) 2)))))

(defn sumprimes [xmax]
  (reduce + (primes xmax)))

(defn -main []
  (println (sumprimes (bigint (* 2 (Math/pow 1000 2))))))

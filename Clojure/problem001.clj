#! /usr/bin/env boot
; Problem 1 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=1

(defn summul1 [n x]
  (/ (* x (quot n x) (inc (quot n x))) 2))
  
(defn summul2 [n x y]
  (- (+ (summul1 n x) (summul1 n y))
    (summul1 n (* x y))))

(defn -main []
  (println (summul2 999 3 5)))

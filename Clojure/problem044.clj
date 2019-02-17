#! /usr/bin/env clojure
; Problem 44 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=44
(defn penta? [y]
  (let [d (+ 1 (* 24 y))
        d_sq (int (Math/sqrt d))]
    (and (= (* d_sq d_sq) d)
         (zero? (mod (inc d_sq) 6)))))

(defn penta [n]
  (/ (* n (dec (* 3 n))) 2))

(loop [k 2 j 1]
  (let [pk (penta k) pj (penta j)]
    (if (and (penta? (+ pk pj))
             (penta? (- pk pj)))
      (println pk pj ", D =" (- pk pj))

      (if (< j (dec k))
        (recur k (inc j))
        (recur (inc k) 1)))))

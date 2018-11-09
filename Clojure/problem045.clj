#! /usr/bin/env clojure
; Problem 45 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=045

(defn triangle [n]
  (/ (* n (inc n))
     2))

(defn penta? [n]
  (let [pn (int
            (/ (+ 1 (Math/sqrt (inc (* 24 n))))
               6))
        penta (/ (* pn (dec (* 3 pn)))
                 2)]
    (= n penta)))
    
(defn hexa? [n]
  (let [hn (int
            (/ (+ 1 (Math/sqrt (inc (* 8 n))))
               4))
        hexa (* hn (dec (* 2 hn)))]
    (= n hexa)))

(loop [n 286]
      (let [tn (triangle n)]
        (if (and (penta? tn) (hexa? tn))
          (println (list n (int tn)))
          (recur (inc n)))))



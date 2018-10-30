#! /usr/bin/env clojure
; Problem 40 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=040

(defn concate-integers [nmax]
  (->> (range 0 nmax)
       (map str)
       (clojure.string/join "")))

(defn ppp [s] (do (println s) s))
(defn c2i [c] (- (int c) 48))

(let [s (concate-integers 1000000)]
  (->> (list (nth s 1)
             (nth s 10)
             (nth s 100)
             (nth s 1000)
             (nth s 10000)
             (nth s 100000)
             (nth s 1000000))
       (ppp)
       (map c2i)
       (reduce *)
       (println)))

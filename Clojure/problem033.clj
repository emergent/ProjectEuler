#! /usr/bin/env clojure
; Problem 33 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=33
(require '[clojure.string :as s])

(defn digit-cancelling-fraction-pair? [nd]
  (letfn [(s2i [s] (if (> (count s) 0)
                     (Integer/parseInt s)
                     1))]
    (let [n (first nd)
          d (second nd)
          d0 (s2i (str (first (str d))))
          d1 (s2i (str (second (str d))))
          n_d0 (s2i (s/replace (str n) (str d0) ""))
          n_d1 (s2i (s/replace (str n) (str d1) ""))]
      (and (or (and (> d0 0) (= (/ n d) (/ n_d1 d0)))
               (and (> d1 0) (= (/ n d) (/ n_d0 d1))))
           (and (not (zero? (mod n 10)))
                (not (zero? (mod d 10))))))))

(->> (for [x (range 10 100)
           y (range (inc x) 100)]
       (list x y))
  (filter digit-cancelling-fraction-pair?)
  (map #(/ (first %) (second %)))
  (reduce *)
  (denominator)
  (println))

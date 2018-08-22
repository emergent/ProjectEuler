#! /usr/bin/env boot
; Problem 12 - Project Euler
; 
; The sequence of triangle numbers is generated by adding the natural numbers. So the 7<sup>th</sup> triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:
; 
; 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
; 
; Let us list the factors of the first seven triangle numbers:
; 
; <blockquote style="font-family:'courier new';">
; <b> 1</b>: 1<br><b> 3</b>: 1,3<br><b> 6</b>: 1,2,3,6<br><b>10</b>: 1,2,5,10<br><b>15</b>: 1,3,5,15<br><b>21</b>: 1,3,7,21<br><b>28</b>: 1,2,4,7,14,28</blockquote>
; We can see that 28 is the first triangle number to have over five divisors.
; 
; What is the value of the first triangle number to have over five hundred divisors?
; 
; http://projecteuler.net/index.php?section=problems&id=012

(defn trinum [i]
  (int (/ (* (inc i) (+ i 2))
          2)))

(defn countdivisors [x]
  (->> (range 1, (Math/floor (Math/sqrt x)))
      (filter #(zero? (mod x %)))
      (map #(list % (quot x %)))
      (flatten)
      (count)
      (list x)))

(defn -main []
  (->> (range)
      (map trinum)
      (map countdivisors)
      (filter #(> (second %) 500))
      (first)
      (println)))

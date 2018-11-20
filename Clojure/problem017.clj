#! /usr/bin/env clojure
; Problem 17 - Project Euler
; http://projecteuler.net/index.php?section=problems&id=017

(defn count-string [s]
  (-> s
      (clojure.string/split #" ")
      (clojure.string/join)
      (count)))

(def count-1-to-9
  (count-string "one two three four five six seven eight nine"))

(def count-10-to-19
  (count-string "ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen"))

(def count-20-to-99
  (-> "twenty thirty forty fifty sixty seventy eighty ninety"
      (clojure.string/split #" ")
      (as-> x
            (map #(+ (* (count %) 10) count-1-to-9) x)
            (reduce + x))))

(def count-1-to-99
  (+ count-1-to-9 count-10-to-19 count-20-to-99))

(def count-100-to-999
  (let [huns (count "hundred")
        ands (count "and")]
    (+ (* count-1-to-9 100)
       (* huns 900)
       (* ands (- 900 9))
       (* count-1-to-99 9))))

(def count-1000
  (count-string "one thousand"))

 (println (+ count-1-to-99
             count-100-to-999
             count-1000))

(ns mathtools)

(defn gcd [a b]
  (loop [m (max a b)
         n (min a b)]
    (if (zero? n)
      m
      (recur n (mod m n)))))

(defn lcm [a b]
  (/ (* a b)
     (gcd a b)))

(defn ppp [str]
  (do (println str) str))

(defn dec2list [x]
  (map #(Integer/parseInt %)
       (-> (str x)
           (clojure.string/split #""))))

(defn factorial [x]
  (reduce *' (range 1 (inc x))))

(defn power [a b]
  (reduce *' (repeat b a)))

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

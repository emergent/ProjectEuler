{-
Problem 1 - Project Euler

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
Find the sum of all the multiples of 3 or 5 below 1000.

http://projecteuler.net/index.php?section=problems&id=1
 -}

summul1 n x = x * div n x * (1 + div n x) `div` 2
summul2 n x y = summul1 n x + summul1 n y - summul1 n (x * y)

problem001 = summul2 999 3 5

main = putStrLn $ "problem001: answer " ++ show problem001
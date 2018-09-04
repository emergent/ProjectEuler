{-
Problem 1 - Project Euler
http://projecteuler.net/index.php?section=problems&id=1
 -}

summul1 n x = x * div n x * (1 + div n x) `div` 2
summul2 n x y = summul1 n x + summul1 n y - summul1 n (x * y)

problem001 = summul2 999 3 5

main = putStrLn $ "problem001: answer " ++ show problem001

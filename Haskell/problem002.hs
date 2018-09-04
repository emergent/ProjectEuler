{-
Problem 2 - Project Euler
http://projecteuler.net/index.php?section=problems&id=2
-}

fib = 0:1:zipWith (+) fib (tail fib)
fibevensum x = sum . filter even . takeWhile (< x) $ fib

problem002 = fibevensum 4000000

main = putStrLn $ "problem002: answer " ++ show problem002

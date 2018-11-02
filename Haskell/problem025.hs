{-
Problem 25 - Project Euler
http://projecteuler.net/index.php?section=problems&id=025
-}

fibodigits' a b i m
    | (length . show $ a) >= m = (i, a)
    | otherwise              = fibodigits' b (a + b) (i + 1) m

fibodigits maxdigits = fibodigits' 1 1 1 maxdigits

problem025 = fibodigits 1000

main = putStrLn $ "problem025: answer " ++ show problem025

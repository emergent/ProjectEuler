{-
Problem 4 - Project Euler
http://projecteuler.net/index.php?section=problems&id=4
-}

isPalindromic :: Int -> Bool
isPalindromic x =
     let s = show x
     in  s == reverse s

problem004 = maximum [(x * y, x, y) | x <- [100..999], y <- [100..x], isPalindromic (x * y)]

main = putStrLn $ "problem004: answer " ++ show problem004

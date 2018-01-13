{-
Problem 4 - Project Euler

A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
Find the largest palindrome made from the product of two 3-digit numbers.

http://projecteuler.net/index.php?section=problems&id=4
-}

isPalindromic :: Int -> Bool
isPalindromic x =
     let s = show x
     in  s == reverse s

problem004 = maximum [(x * y, x, y) | x <- [100..999], y <- [100..x], isPalindromic (x * y) == True]

main = do
    putStrLn $ "problem004: answer " ++ show problem004

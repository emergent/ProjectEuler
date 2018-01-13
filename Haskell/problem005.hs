{-
Problem 5 - Project Euler

2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is <dfn title="divisible with no remainder">evenly divisible</dfn> by all of the numbers from 1 to 20?

http://projecteuler.net/index.php?section=problems&id=5
-}

divided x [] = x
divided x (y:ys) = 
    if mod x y == 0 
        then divided (div x y) ys
        else divided x ys

mindivisibles [] = []
mindivisibles (x:xs) = (divided x (mindivisibles xs)) : (mindivisibles xs)

problem005 = product . mindivisibles . reverse $ [1..20]

main = do
    putStrLn $ "problem005: answer " ++ show problem005

{-
Problem 5 - Project Euler

2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
What is the smallest positive number that is <dfn title="divisible with no remainder">evenly divisible</dfn> by all of the numbers from 1 to 20?

http://projecteuler.net/index.php?section=problems&id=5
-}

problem005 = foldr1 lcm [1..20]

main = do
    putStrLn $ "problem005: answer " ++ show problem005

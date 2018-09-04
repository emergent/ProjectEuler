{-
Problem 5 - Project Euler
http://projecteuler.net/index.php?section=problems&id=5
-}

problem005 = foldr1 lcm [1..20]

main = putStrLn $ "problem005: answer " ++ show problem005

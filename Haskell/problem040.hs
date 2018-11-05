{-
Problem 40 - Project Euler
http://projecteuler.net/index.php?section=problems&id=040
-}

concatIntegers nmax = concat $ map show [0..nmax]

problem040 = 
            let
                ci = concatIntegers 1000000
                d = [1, 10, 100, 1000, 10000, 100000, 1000000]
                ds = map ((!!) ci) d
            in
                product (map (read . return) ds :: [Int])

main = putStrLn $ "problem040: answer " ++ show problem040

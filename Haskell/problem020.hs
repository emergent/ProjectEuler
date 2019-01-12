{-
Problem 20 - Project Euler
http://projecteuler.net/index.php?section=problems&id=020
-}

factorial n = product [1..n]

problem020 =
            let
                n = show $ factorial 100
            in
                sum (map (read . return)  n :: [Int])

main = putStrLn $ "problem020: answer " ++ show problem020

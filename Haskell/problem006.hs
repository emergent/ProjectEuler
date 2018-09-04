{-
Problem 6 - Project Euler
http://projecteuler.net/index.php?section=problems&id=6
-}

diffs xs = sum xs ^ 2 - (sum . map (^ 2) $ xs)
problem006 = diffs [1..100]

main = putStrLn $ "problem006: answer " ++ show problem006

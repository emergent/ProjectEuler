{-
Problem 16 - Project Euler
http://projecteuler.net/index.php?section=problems&id=16
-}
import Data.Char

-- powerPos :: Int -> Int -> Int
powerPos n p | p > 0 = n * powerPos n (p - 1)
powerPos _ 0 = 1
powerPos _ _ = 0

problem016 = sum . map (\a -> ord a - 48) . show $ powerPos 2 1000

main = putStrLn $ "problem016: answer " ++ show problem016

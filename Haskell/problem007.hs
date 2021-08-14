{-
Problem 7 - Project Euler
http://projecteuler.net/index.php?section=problems&id=7
-}
sieve :: Int -> [Int] -> [Int] -> [Int]
sieve _ _ [] = []
sieve m xs (y : ys)
  | y * y >= m = reverse xs ++ y : ys
  | otherwise = sieve m (y : xs) (filter (\a -> a `mod` y /= 0) ys)

primesBelow x = sieve x [] [2, 3 .. x]

problem007 = primesBelow 500000 !! (10001 -1)

main = putStrLn $ "problem007: answer " ++ show problem007

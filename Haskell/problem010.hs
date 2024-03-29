{-
Problem 10 - Project Euler
http://projecteuler.net/index.php?section=problems&id=10
-}

sieve :: Int -> [Int] -> [Int] -> [Int]
sieve _ _ [] = []
sieve m xs (y : ys)
  | y * y >= m = reverse xs ++ y : ys
  | otherwise = sieve m (y : xs) (filter (\a -> a `mod` y /= 0) ys)

primesBelow x = sieve x [] [2, 3 .. x]

problem010 = sum . primesBelow $ (2 * 1000 * 1000)

main = putStrLn $ "problem010: answer " ++ show problem010

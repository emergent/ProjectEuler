{-
Problem 12 - Project Euler
http://projecteuler.net/index.php?section=problems&id=12
-}
import Data.Set as Set

countdivs :: Int -> Int
countdivs t =
  let ds = takeWhile (\x -> x * x <= t) [1 ..]
   in length . Set.toList . Set.fromList $ concat [[d, t `quot` d] | d <- ds, t `mod` d == 0]

trinumCountdivisors :: Int -> Int -> Int
trinumCountdivisors m x =
  let tri = (1 + x) * x `quot` 2
   in if countdivs tri > m
        then tri
        else trinumCountdivisors m (x + 1)

problem012 = trinumCountdivisors 500 1

main = putStrLn $ "problem012: answer " ++ show problem012

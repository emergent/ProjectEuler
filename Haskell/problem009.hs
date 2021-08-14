{-
Problem 9 - Project Euler
http://projecteuler.net/index.php?section=problems&id=9
-}

pythagorean a b c
  | a * a + b * b == c * c = a * b * c
  | otherwise =
    if b < c + 1
      then pythagorean a (b + 1) (c - 1)
      else
        let total = a + b + c
            a' = a + 1
            b' = a' + 1
            c' = total - a' - b'
         in pythagorean a' b' c'

problem009 = pythagorean 1 2 (1000 - 1 - 2)

main = putStrLn $ "problem009: answer " ++ show problem009

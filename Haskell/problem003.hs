{-
Problem 3 - Project Euler

The prime factors of 13195 are 5, 7, 13 and 29.
What is the largest prime factor of the number 600851475143 ?

http://projecteuler.net/index.php?section=problems&id=3
-}

sqrtfloor = floor . sqrt . fromIntegral
isPrime x = (odd x || x == 2) && undividable x (sqrtfloor x)
undividable m n
    | n <= 2          = True
    | otherwise       = (mod m n /= 0) && undividable m (n - 1)
isMaxFactor m n = if isPrime n && mod m n == 0 then n else isMaxFactor m (n - 1)
maxprime n = isMaxFactor n $ sqrtfloor n

problem003 = maxprime 600851475143

main = putStrLn $ "problem003: answer " ++ show problem003

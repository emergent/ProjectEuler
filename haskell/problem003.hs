{-
Problem 3 - Project Euler

The prime factors of 13195 are 5, 7, 13 and 29.
What is the largest prime factor of the number 600851475143 ?

http://projecteuler.net/index.php?section=problems&id=3
-}

primes = 2:sieve [3,5..]
sieve (p:ps) = p:sieve [q | q <- ps, q `mod` p /= 0]

primemax n = 
    let primes_cand = takeWhile (< (floor . sqrt . fromIntegral $ n)) primes
        divisor     = [x | x <- primes_cand, n `mod` x == 0]
    in  maximum divisor

problem003 = primemax 600851475143

main = do
    print $ "problem003: answer " ++ show problem003

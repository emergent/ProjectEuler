{-
Problem 10 - Project Euler

The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
Find the sum of all the primes below two million.

http://projecteuler.net/index.php?section=problems&id=10
-}

sieve :: Int -> Int -> [Int] -> [Int]
sieve n maxn ls =
    let
        k = ls !! n
        f x = (x == k) || x `mod` k /= 0
    in
        if k > maxn
            then ls
            else sieve (n + 1) maxn (filter f ls)

sqfl = floor . sqrt . fromIntegral

primes :: Int -> [Int]
primes x
    | x <  2 = []
    | x == 2 = 2 : []
    | x >  2 = 2 : (sieve 0 (sqfl x) [3,5..x])

problem010 = sum . primes $ (2 * 1000 * 1000)

main = do
    print $ "problem010: answer " ++ show problem010

{-
Problem 3 - Project Euler
http://projecteuler.net/index.php?section=problems&id=3
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
    | x == 2 = 2:[]
    | x >  2 = 2 : (sieve 0 (sqfl x) [3,5..x])

maxprimefactor' :: Int -> [Int] -> Int
maxprimefactor' x [] = x
maxprimefactor' x (p:ps) = if x `mod` p == 0
    then
        let qx = div x p
        in
            if qx == 1 then x else (maxprimefactor' qx ps)
    else
        maxprimefactor' x ps

maxprimefactor :: Int -> Int
maxprimefactor x = maxprimefactor' x (primes (sqfl x))

problem003 = maxprimefactor 600851475143

main = putStrLn $ "problem003: answer " ++ show problem003

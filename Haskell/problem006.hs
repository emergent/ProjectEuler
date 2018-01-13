{-
Problem 6 - Project Euler

The sum of the squares of the first ten natural numbers is,

<div style="text-align:center;">1<sup>2</sup> + 2<sup>2</sup> + ... + 10<sup>2</sup> = 385</div>
The square of the sum of the first ten natural numbers is,

<div style="text-align:center;">(1 + 2 + ... + 10)<sup>2</sup> = 55<sup>2</sup> = 3025</div>
Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

http://projecteuler.net/index.php?section=problems&id=6
-}

diffs xs = (sum xs) ^ 2 - (sum . map (^ 2) $ xs)
problem006 = diffs [1..100]

main = do
    putStrLn $ "problem006: answer " ++ show problem006

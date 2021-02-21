module Problems.P009 exposing (run)

{-
   Problem 9 - Project Euler
   https://projecteuler.net/problem=9
-}


run : Bool -> Int
run b =
    if b then
        pytha 1 1 (1000 - 2)

    else
        -1


pytha : Int -> Int -> Int -> Int
pytha a b c =
    if a * a + b * b == c * c then
        a * b * c

    else if b >= c then
        pytha (a + 1) (a + 1) (a + b + c - (a * 2 + 2))

    else
        pytha a (b + 1) (c - 1)

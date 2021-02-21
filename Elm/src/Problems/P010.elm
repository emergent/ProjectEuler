module Problems.P010 exposing (run)

{-
   Problem 10 - Project Euler
   https://projecteuler.net/problem=10
-}

import Arithmetic


run : Bool -> Int
run b =
    if b then
        Arithmetic.primesBelow 2000000 |> List.foldl (+) 0

    else
        -1

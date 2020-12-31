module Problems.P007 exposing (run)

{-
   Problem 7 - Project Euler
   https://projecteuler.net/problem=7
-}

import Arithmetic
import Array


run : Bool -> Int
run b =
    if b then
        Arithmetic.primesBelow 500000
            |> Array.fromList
            |> Array.get 10000
            |> Maybe.withDefault -1

    else
        -1

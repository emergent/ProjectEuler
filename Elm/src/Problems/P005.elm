module Problems.P005 exposing (run)

{-
   Problem 5 - Project Euler
   https://projecteuler.net/problem=5
-}

import Arithmetic exposing (lcm)


run : Bool -> Int
run b =
    if b == True then
        List.range 2 20
            |> List.foldl lcm 1

    else
        -1

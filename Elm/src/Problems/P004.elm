module Problems.P004 exposing (run)

{-
   Problem 4 - Project Euler
   https://projecteuler.net/problem=4
-}

import List exposing (maximum, range)


run : Bool -> Int
run b =
    if b then
        range 1 999
            |> List.filterMap
                (\x ->
                    range x 999
                        |> List.map (\y -> x * y)
                        |> List.filter isPalindromic
                        |> maximum
                )
            |> maximum
            |> Maybe.withDefault -1

    else
        -1


isPalindromic : Int -> Bool
isPalindromic x =
    String.fromInt x == (String.fromInt x |> String.reverse)

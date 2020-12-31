module Problems.P003 exposing (run)

{-
   Problem 3 - Project Euler
   https://projecteuler.net/problem=3
-}

import BigInt exposing (BigInt, add, div, fromInt)


run : Bool -> Int
run b =
    if b then
        maxPrimeFactor (fromInt 600851475143)

    else
        -1


maxPrimeFactor : BigInt -> Int
maxPrimeFactor x =
    let
        m =
            mpf x (fromInt 2) 0
    in
    case m of
        Just ans ->
            ans

        Nothing ->
            -1


mpf : BigInt -> BigInt -> Int -> Maybe Int
mpf x y count =
    if x == fromInt 1 then
        BigInt.toString y |> String.toInt

    else if BigInt.modBy y x == Just (fromInt 0) then
        let
            _ =
                Debug.log ("x=" ++ BigInt.toString x ++ ", y=" ++ BigInt.toString y) count
        in
        mpf (div x y) y (count + 1)

    else
        mpf x (add y (fromInt 1)) (count + 1)

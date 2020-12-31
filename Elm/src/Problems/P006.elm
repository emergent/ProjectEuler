module Problems.P006 exposing (run)

{-
   Problem 6 - Project Euler
   https://projecteuler.net/problem=6
-}


run : Bool -> Int
run b =
    if b then
        let
            s1 =
                List.range 1 100 |> List.sum

            s2 =
                List.range 1 100 |> List.map (\x -> x * x) |> List.sum
        in
        s1 * s1 - s2

    else
        -1

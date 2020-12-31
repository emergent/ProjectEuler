module Problems.P001 exposing (run)

{-
   Problem 1 - Project Euler
   http://projecteuler.net/index.php?section=problems&id=1
-}


run : Bool -> Int
run b =
    if b == True then
        let
            sum3 =
                (1000 // 3) * (3 + 999) // 2

            sum5 =
                (1000 // 5) * (5 + 995) // 2

            sum15 =
                (1000 // 15) * (15 + 990) // 2
        in
        sum3 + sum5 - sum15

    else
        -1

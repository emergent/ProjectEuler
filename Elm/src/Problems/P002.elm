module Problems.P002 exposing (run)


run : Bool -> Int
run b =
    if b == True then
        fibEvenSum 4000000 1 2

    else
        -1


fibEvenSum : Int -> Int -> Int -> Int
fibEvenSum max x y =
    if x >= max then
        if modBy 2 x == 0 then
            x

        else
            0

    else if modBy 2 x == 0 then
        x + fibEvenSum max y (x + y)

    else
        fibEvenSum max y (x + y)

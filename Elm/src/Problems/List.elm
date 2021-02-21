module Problems.List exposing (problems, solve)

import Problems.P001
import Problems.P002
import Problems.P003
import Problems.P004
import Problems.P005
import Problems.P006
import Problems.P007
import Problems.P008
import Problems.P009
import Problems.P010


problems : List Int
problems =
    [ 1
    , 2
    , 3
    , 4
    , 5
    , 6
    , 7
    , 8
    , 9
    , 10
    ]


solve : Int -> Int
solve i =
    case i of
        1 ->
            Problems.P001.run True

        2 ->
            Problems.P002.run True

        3 ->
            Problems.P003.run True

        4 ->
            Problems.P004.run True

        5 ->
            Problems.P005.run True

        6 ->
            Problems.P006.run True

        7 ->
            Problems.P007.run True

        8 ->
            Problems.P008.run True

        9 ->
            Problems.P009.run True

        10 ->
            Problems.P010.run True

        _ ->
            -1

// Problem 3 - Project Euler
// https://projecteuler.net/problem=3

let rec maxprimefactor x y =
    match x with
    | 1L -> y
    | z ->
        if z % y = 0L then
            maxprimefactor (z / y) y
        else
            maxprimefactor z (y + 1L)


printfn "%i" (maxprimefactor 600851475143L 2L)

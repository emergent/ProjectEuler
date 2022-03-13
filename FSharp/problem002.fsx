// Problem 2 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=2

let rec fibevensum max x y =
    if x >= max then
        if x % 2 = 0 then x else 0
    elif x % 2 = 0 then
        x + fibevensum max y (x + y)
    else
        fibevensum max y (x + y)

printfn "%i" (fibevensum 4000000 1 2)

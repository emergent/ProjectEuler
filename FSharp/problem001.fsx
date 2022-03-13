// Problem 1 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=1

let summul1 n x = x * (n / x) * (n / x + 1) / 2

let summul2 n x y =
    summul1 n x + summul1 n y - summul1 n (x * y)

printfn "%i" (summul2 999 3 5)

// Problem 5 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=5

let rec gcd x y = if x = 0L then y else gcd (y % x) x

let lcm x y = x * y / (gcd x y)

printfn
    "%i"
    ((1L, [ 1L .. 20L ])
     ||> List.fold (fun x y -> lcm x y))

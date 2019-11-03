// Problem 1 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=1
func summul(n: Int, x: Int) -> Int {
    return (x * (n / x) * (n / x + 1) / 2)
}

func solve(n: Int, x: Int, y: Int) -> Int {
    return summul(n: n, x: x) + summul(n: n, x: y) - summul(n: n, x: x * y)
}

print(solve(n: 999, x: 3, y: 5))

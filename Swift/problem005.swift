// Problem 5 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=5
func gcd(_ x: Int, _ y: Int) -> Int {
    return y == 0 ? x : gcd(y, x % y)
}

func lcm(_ x: Int, _ y: Int) -> Int {
    return (x == 0 || y == 0) ? 0 : x * y / gcd(x, y)
}

print((1...20).reduce(1, lcm))

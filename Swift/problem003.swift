// Problem 3 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=3
func maxprimefactor(x: Int) -> Int {
    var acc = x
    var n = 2
    while n * n <= acc {
        if acc % n == 0 {
            acc /= n
        } else {
            n += 1
        }
    }
    return acc
}

print(maxprimefactor(x: 600_851_475_143))

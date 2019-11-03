// Problem 10 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=10
func primes(_ n: Int) -> Array<Int> {
    var is_p = [Bool](repeating: true, count: n + 1)
    var ps = [Int]()

    if n >= 2 {
        for i in 2...n {
            if is_p[i] {
                ps.append(i)
            }
            if i * i <= n {
                for j in 2...(n / i) {
                    is_p[i * j] = false
                }
            }
        }
    }
    return ps
}

print(primes(2_000_000).reduce(0) {
    $0 + $1
})

// Problem 12 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=12
func count_divisors(_ x: Int) -> Int {
    var count = 0;
    var i = 1;
    while i * i <= x {
        if x % i == 0 {
            if i * i == x {
                count += 1
            } else {
                count += 2
            }
        }
        i += 1
    }
    return count
}

func solve() {
    var i = 1
    var n = 1
    while true {
        if count_divisors(n) > 500 {
            print(n)
            break
        }
        i += 1
        n += i
    }
}

solve()

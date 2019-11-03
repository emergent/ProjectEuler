// Problem 7 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=7
func isPrime(_ x: Int) -> Bool {
    switch x {
    case let y where y < 2:
        return false
    case 2:
        return true
    case let z where z % 2 == 0:
        return false
    default:
        var i = 3
        while i * i <= x {
            if x % i == 0 {
                return false
            }
            i += 2
        }
    }
    return true
}

func nthPrime(_ n: Int) -> Int {
    var count = 1
    var p = 3
    while true {
        if isPrime(p) {
            count += 1
            if count == n {
                break
            }
        }
        p += 2
    }
    return p
}

print(nthPrime(10_001))

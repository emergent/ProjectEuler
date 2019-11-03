// Problem 2 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=2
func fibevensum(n: Int) -> Int {
    var a = 1
    var b = 2
    var sum = b
    var tmp = a

    while a < n {
        tmp = b
        b = a + b
        a = tmp

        if b % 2 == 0 {
            sum += b
        }
    }
    return sum
}

print(fibevensum(n: 4_000_000))

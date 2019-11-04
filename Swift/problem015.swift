// Problem 15 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=15
func solve() {
    let n = 40
    let k = 20
    var c = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: n + 1)
    for i in 0...n {
        for j in 0...i {
            if i == 0 || j == 0 {
                c[i][j] = 1
            } else {
                c[i][j] = c[i - 1][j - 1] + c[i - 1][j]
            }
        }
    }
    print(c[n][k])
}

solve()

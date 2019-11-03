// Problem 4 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=4
func is_palindromic(x: Int) -> Bool {
    return String(String(x).reversed()) == String(x)
}

var maxnum = 0
for i in 100...999 {
    for j in i...999 {
        let n = i * j
        if is_palindromic(x: n) {
            maxnum = max(maxnum, n)
        }
    }
}
print(maxnum)

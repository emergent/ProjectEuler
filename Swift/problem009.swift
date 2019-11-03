// Problem 9 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=9
loop: for a in 1...1000 {
    for b in a...1000 {
        let a2b2 = Double(a * a + b * b)
        let c = Int(a2b2.squareRoot())
        if a * a + b * b == c * c && a + b + c == 1000 {
            print(a * b * c)
            break loop
        }
    }
}

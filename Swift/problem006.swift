// Problem 6 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=6
let sqsum = (1...100).reduce(0, { (acc, x) in acc + x * x })
let sum = (1...100).reduce(0, { (acc, x) in acc + x})
print(sum * sum - sqsum)

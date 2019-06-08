// Problem 2 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=2

def fibevensum(xmax: Int): Int = {
  var a = 1
  var b = 2
  var sum = 0;

  while (a <= xmax) {
    if (a % 2 == 0) {
      sum += a
    }

    b = a + b
    a = b - a
  }
  sum
}

println(fibevensum(4000000))

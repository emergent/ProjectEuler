// Problem 3 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=3

object Problem003 {
  def maxPrimeFactor(x: Long): Long = {
    var d = 2
    var t = x

    while (t != 1) {
      if (t % d == 0) {
        t /= d
      } else {
        d += 1
      }
    }
    d
  }

  def main(args: Array[String]) :Unit = {
    println(maxPrimeFactor(600851475143L))
  }
}

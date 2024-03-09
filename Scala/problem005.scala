// Problem 5 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=5

object Problem005 {
  def gcd(x: Long, y: Long): Long = {
    if (x == 0) {
      y
    } else {
      gcd(y % x, x)
    }
  }

  def lcm(x: Long, y: Long): Long = {
    x * y / gcd(x, y)
  }

  def main(args: Array[String]) :Unit = {
    println((1L to 20).reduce((x, y) => lcm(x, y)))
  }
}

// Problem 1 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=1

object Problem001 {
  def summul(n: Int, x: Int): Int = {
    val count = n / x
    x * (count * (1 + count) / 2)
  }

  def main(args: Array[String]) : Unit = {
    println(summul(999, 3) + summul(999, 5) - summul(999, 15))
  }
}

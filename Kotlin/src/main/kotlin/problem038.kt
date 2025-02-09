// Problem 38 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=38
fun isPandigital9digits(x: Int): Boolean {
  return (x.toString() + "0").toSet().count() == 10
}

fun main() {
  val maxp =
      (9183..9999)
          .map { p -> (p.toString() + (p * 2).toString()).toInt() }
          .filter { isPandigital9digits(it) }
          .max()
  println(maxp)
}

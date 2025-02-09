/*
 * Problem 5 - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=5
 */
fun gcd(x: Long, y: Long): Long {
  return if (x == 0L) {
    y
  } else {
    gcd(y % x, x)
  }
}

fun lcm(x: Long, y: Long): Long {
  return x * y / gcd(x, y)
}

fun main() {
  println((1L..20).fold(1L, { x, y -> lcm(x, y) }))
}

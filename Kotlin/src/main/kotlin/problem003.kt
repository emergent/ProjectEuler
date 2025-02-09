/*
 * Problem 3 - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=3
 */
fun maxprimefactor(x: Long): Long {
  var divider: Long = 2
  var target: Long = x

  while (target != 1L) {
    if (target % divider == 0L) {
      target /= divider
    } else {
      divider += 1
    }
  }
  return divider
}

fun main() {
  println(maxprimefactor(600851475143))
}

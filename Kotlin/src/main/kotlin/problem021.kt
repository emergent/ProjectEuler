// Problem 21 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=21
import kotlin.math.*

fun divisors(x: Int): List<Int> {
  val lim = ceil(sqrt(x.toDouble())).toInt()
  return (1..lim)
      .map { n -> if (x % n == 0) listOf(n, x / n) else null }
      .filterNotNull()
      .flatten()
      .distinct()
      .toList()
}

fun d(x: Int) = divisors(x).sum() - x

fun amicable_pair(x: Int): Int? {
  val dx = d(x)
  return if (d(dx) == x && dx != x) dx else null
}

fun main() {
  val ans = (1..10000 - 1).map { amicable_pair(it) }.filterNotNull().filter { it < 10000 }.sum()
  println(ans)
}

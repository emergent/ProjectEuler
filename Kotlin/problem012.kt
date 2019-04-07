// Problem 12 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=12
import kotlin.math.*

fun count_divisors(x: Int): Int {
    val lim = ceil(sqrt(x.toDouble())).toInt()
    return (1..lim)
            .map { n ->
                if (x % n == 0) listOf(n, x/n) else null
            }
            .filterNotNull()
            .flatten()
            .distinct()
            .count()
}

fun Int.triangle() = this * (this + 1) / 2

fun main(args: Array<String>) {
    var n = 1
    while (count_divisors(n.triangle()) <= 500) {
        n++
    }
    println("${n.triangle()}")
}

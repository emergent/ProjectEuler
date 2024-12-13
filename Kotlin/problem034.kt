// Problem 34 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=34
fun Int.fac() = when {
    this <= 1 -> 1
    else -> (1..this).fold(1) { acc, p -> acc * p }
}

fun main(args: Array<String>) {
    println((10..2540160) // 9! * 7 = 2540160
            .filter {
                it == it.toString()
                        .map { c -> (c.code - 48).fac() }
                        .sum()
            }
            .sum())
}

// Problem 30 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=30
fun Int.nth_power(n: Int): Int {
    var x = 1
    repeat(n) { x *= this }
    return x
}

fun main() {
    val sum = (2..354294)
            .map { x ->
                Pair(x, x.toString()
                        .map { c -> (c.code - 48).nth_power(5) }
                        .sum())
            }
            .filter { it.first == it.second }
            .map { it.first }
            .sum()
    println(sum)
}

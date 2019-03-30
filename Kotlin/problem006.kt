/*
 * Problem 6 - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=6
 */
fun main(args: Array<String>) {
    val limit = 100;
    val sum = (1 + limit) * limit / 2
    val sumsq = sum * sum
    val sqsum = (1..limit).map { it * it }.sum()
    println(sumsq - sqsum)
}

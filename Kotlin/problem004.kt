/*
 * Problem 4 - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=4
 */
fun isPalindromic(x: Int): Boolean {
    return x.toString().reversed() == x.toString()
}
fun main(args: Array<String>) {
    val pmax = (100..1000).map { i ->
                (i..1000).map { j -> i * j }
            }
            .flatten()
            .distinct()
            .filter { isPalindromic(it) }
            .max()

    println(pmax)
}

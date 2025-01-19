/*
 * Problem 2 - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=2
 */
fun fibevensum2(a: Int, b: Int, sum: Int, xmax: Int): Int {
    return if (a >= xmax) {
        sum
    } else if (a % 2 == 0) {
        fibevensum2(b, a + b, sum + a, xmax)
    } else {
        fibevensum2(b, a + b, sum, xmax)
    }
}

fun fibevensum(xmax: Int) = fibevensum2(1, 2, 0, xmax)

fun main() {
    println(fibevensum(4000000))
}

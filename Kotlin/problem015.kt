// Problem 15 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=15
fun comb(n: Long, k: Long): Long {
    when (k) {
        1L -> return n
        else -> return comb(n, k - 1) * (n - k + 1) / k
    }
}

fun main(args: Array<String>) {
    println(comb(40, 20))
}

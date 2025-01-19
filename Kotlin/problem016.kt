// Problem 16 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=16
fun sum_of_digits_power(x: Int, p: Int): Int {
    return x.toBigInteger()
            .pow(p)
            .toString()
            .map { it.code - 48 }
            .sum()
}

fun main() {
    println(sum_of_digits_power(2, 1000))
}

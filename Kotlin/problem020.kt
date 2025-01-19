// Problem 20 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=20
fun sum_of_digits_factorial(x: Int): Int {
    return (1..x).fold(1.toBigInteger(), { p, i -> p * i.toBigInteger() })
            .toString()
            .map { it.code - 48 }
            .sum()
}

fun main() {
    println(sum_of_digits_factorial(100))
}

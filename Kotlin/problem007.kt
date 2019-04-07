// Problem 7 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=7
import kotlin.math.*

fun is_prime(x: Int): Boolean {
    return when {
        x <= 1 -> false
        x == 2 -> true
        x % 2 == 0 -> false
        else -> {
            val lim = ceil(sqrt(x.toDouble())).toInt()
            (3..lim).step(2)
                    .all { x % it != 0 }
        }
    }
}

fun prime_index(n: Int): Int {
    if (n == 1) { return 2 }

    var i = 1
    var num = 3
    while (true) {
        if (is_prime(num)) { i++ }
        if (i >= n) { break }
        num += 2
    }
    return num
}

fun main(args: Array<String>) {
    println(prime_index(10001))
}

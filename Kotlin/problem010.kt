// Problem 10 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=10
import kotlin.math.*

fun primes(xmax: Int): List<Int> {
    val lim = ceil(sqrt(xmax.toDouble())).toInt()
    val ps3_ = (3..xmax step 2)
            .filter { x ->
                var ret = true
                loop@ for (i in 3..lim) {
                    when {
                        x <= i -> {
                            ret = true
                            break@loop
                        }
                        x % i == 0 -> {
                            ret = false
                            break@loop
                        }
                        else -> continue@loop
                    }
                }
                ret
            }
    return listOf(2).plus(ps3_)
}

fun main(args: Array<String>) {
    val ans = primes(2_000_000).map{ it.toLong() }.sum()
    println(ans)
}

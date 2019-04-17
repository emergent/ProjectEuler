package projecteuler.prime
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

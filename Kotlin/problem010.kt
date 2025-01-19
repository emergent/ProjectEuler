// Problem 10 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=10
import kotlin.math.*

fun primes(n: Int): List<Int> {
    val is_p = BooleanArray(n+1, {true})
    val ps: MutableList<Int> = mutableListOf()
    if (n >= 2) {
        for (i in 2..n){
            if (is_p[i]) {
                ps.add(i)
            }
            if (i * i <= n) {
                for (j in 2..(n / i)) {
                    is_p[i * j] = false
                }
            }
        }
    }
    return ps
}

fun main() {
    val ans = primes(2_000_000).map{ it.toLong() }.sum()
    println(ans)
}

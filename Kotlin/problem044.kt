// Problem 44 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=44
import kotlin.math.*

fun is_penta(i: Int): Boolean {
    val d = 1 + 24 * i
    val d_sq = sqrt(d.toDouble()).toInt()
    return d_sq * d_sq == d && (d_sq + 1) % 6 == 0
}

fun penta(i: Int): Int {
    return i * (3 * i - 1) / 2
}

fun main() {
    var k = 2
    loop@ while (true) {
        val pk = penta(k)

        for (j in 1..k) {
            val pj = penta(j)
            val p1 = pk - pj
            val p2 = pk + pj

            if (is_penta(p1) && is_penta(p2)) {
                println(pk)
                println(pj)
                println(p1)
                break@loop
            }
        }

        k += 1
    }
}

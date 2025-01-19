// Problem 36 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=36
fun Int.is_pal(base: Int): Boolean {
    return this.toString(base).reversed() == this.toString(base)
}

fun main() {
    println((1..1_000_000 step 2)
            .filter { it.is_pal(2) && it.is_pal(10) }
            .sum())
}

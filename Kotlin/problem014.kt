// Problem 14 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=14
fun main(args: Array<String>) {
    var map = mutableMapOf(1L to 1L)
    for (i in 2L..1000000) {
        var x = i
        var count = 0L
        while (x != 1L) {
            val mx = map[x]
            if (mx != null) {
                count += mx
                break
            } else {
                x = f(x)
                count++
            }
        }
        map[i] = count
    }
    val maxitem = map.maxBy { it.value }
    println(maxitem?.key)
}

fun f(x: Long): Long {
    return if (x % 2 == 0L) x / 2 else 3 * x + 1
}

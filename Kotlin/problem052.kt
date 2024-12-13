// Problem 52 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=52
fun main(args: Array<String>) {
    var i = 100000
    while (!hasSameDigits(i)) i++
    println(i)
}

fun hasSameDigits(x: Int): Boolean {
    val dset = digitSet(x)
    if (dset.size < x.toString().length) {
        return false
    }
    for (i in 2..6) {
        if (dset != digitSet(x * i)) {
            return false
        }
    }
    return true
}

fun digitSet(x: Int): Set<Int> {
    return x.toString().map { it.code - 48 }.toSet()
}

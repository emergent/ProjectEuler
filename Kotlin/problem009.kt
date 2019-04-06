// Problem 9 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=9
fun pythagorean_triplet(c: Int): Triple<Int, Int, Int>? {
    for (b in 4..(c-1)) {
        for (a in 3..(b-1)) {
            if (a * a + b * b == c * c) {
                return Triple(a, b, c)
            }
        }
    }
    return null
}

fun main(args: Array<String>) {
    val abclist = (5..999)
            .map { pythagorean_triplet(it)?.toList() }
            .filterNotNull()
            .filter { 1000 % it.sum() == 0 }
            .first()
    val quot = 1000 / abclist.sum()
    val abc = abclist
            .map { it * quot }
            .reduce { acc, x -> acc * x }
    println(abc)
}

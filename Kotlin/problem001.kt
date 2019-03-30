fun summul1(n: Int, x: Int): Int {
    return (x * (n / x) * (n / x + 1)) / 2
}

fun summul2(n: Int, x: Int, y: Int): Int {
    return summul1(n, x) + summul1(n, y) - summul1(n, x * y)
}

fun main(args: Array<String>) {
    println(summul2(999, 3, 5))
}

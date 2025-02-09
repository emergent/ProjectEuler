// #17 Number Letter Counts - Project Euler
// http://projecteuler.net/problem=17

fun countStrings(string: String): Int {
    return string.split(" ").map { it.length }.sum()
}

fun countFrom1To9(): Int {
    return countStrings("one two three four five six seven eight nine")
}

fun countFrom10To19(): Int {
    return countStrings("ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen")
}

fun countFrom20To99(): Int {
    return "twenty thirty forty fifty sixty seventy eighty ninety".split(" ").map { it.length * 10 + countFrom1To9()}.sum()
}

fun countFrom1To99(): Int {
    return countFrom1To9()  + countFrom10To19() + countFrom20To99()
}

fun countFrom100To999(): Int {
    return countFrom1To9() * 100 + "hundred".length * 900  + "and".length * (900 - 9)     + countFrom1To99() * 9
}

fun count1000(): Int {
    return countStrings("one thousand")
}

fun main() {
    val ans = countFrom1To99() + countFrom100To999() + count1000()
    println(ans)
}

// Problem 40 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=40
fun main(args: Array<String>) {
    var n = 1
    var str = ""
    var d = 1
    var ans = listOf<Char>()
    while (str.length < 100000) {
        str += n.toString()

        if (str.length > d) {
            ans = ans.plus(str[d-1])
            d *= 10
        }
        n++
    }
    println(ans)
    println(ans.map { it.toInt() - 48 }.fold(1) { acc, x -> acc * x })
}

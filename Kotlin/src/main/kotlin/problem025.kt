// Problem 25 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=25
fun fib_digits_index(digits_len: Int): Int {
  var a = 1.toBigInteger()
  var b = 1.toBigInteger()
  var index = 2
  while (b.toString().length < digits_len) {
    val tmp = a
    a = b
    b = b + tmp
    index += 1
  }
  return index
}

fun main() {
  println(fib_digits_index(1000))
}

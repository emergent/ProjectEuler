// Problem 29 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=29
fun main() {
  println((2..100).flatMap { a -> (2..100).map { b -> a.toBigInteger().pow(b) } }.toSet().count())
}

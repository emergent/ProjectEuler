// Problem 4 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=4

def isPalindromic(x: Int): Boolean = {
  x.toString.reverse == x.toString
}

val pmax = (100 until 1000)
  .flatMap(i => (i until 1000).map(j => i * j))
  .toSet
  .filter(isPalindromic)
  .max

println(pmax)


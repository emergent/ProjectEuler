package projecteuler

// Problem 1 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=1
import (
	"log"
)

func summul1(n int32, x int32) int32 {
	return (x * (n / x) * (n/x + 1)) / 2
}

func summul2(n int32, x int32, y int32) int32 {
	return summul1(n, x) + summul1(n, y) - summul1(n, x*y)
}

func P001() {
	log.Println(summul2(999, 3, 5))
}

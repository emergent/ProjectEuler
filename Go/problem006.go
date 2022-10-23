package projecteuler

// Problem 6 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=6
import "log"

func P006() {
	const n = 100
	sumsq := 0
	for i := 1; i <= n; i++ {
		sumsq += i * i
	}
	sqsum := (1 + n) * n / 2
	log.Println(sqsum*sqsum - sumsq)

	// solve with O(1)
	log.Println((n - 1) * n * (n + 1) * (3*n + 2) / 12)
}

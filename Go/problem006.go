package main

// Problem 6 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=6
import "fmt"

func main() {
	const n = 100
	sumsq := 0
	for i := 1; i <= n; i++ {
		sumsq += i * i
	}
	sqsum := (1 + n) * n / 2
	fmt.Println(sqsum*sqsum - sumsq)

	// solve with O(1)
	fmt.Println((n - 1) * n * (n + 1) * (3*n + 2) / 12)
}

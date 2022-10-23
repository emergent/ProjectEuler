package projecteuler

// Problem 3 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=3
import "log"

func MaxPrimeFactor(x int) int {
	for n := 2; n != x; n++ {
		for x%n == 0 {
			x /= n
		}
	}
	return x
}

func P003() {
	log.Println(MaxPrimeFactor(600851475143))
}

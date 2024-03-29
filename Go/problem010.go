package projecteuler

// #10 Summation of primes - Project Euler
// http://projecteuler.net/index.php?section=problems&id=10
import (
	"log"
	"projecteuler/my"
)

func P010() {
	var ans int
	for _, v := range my.Primes(2000000) {
		ans += v
	}

	log.Println(ans)
}

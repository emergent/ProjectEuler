package projecteuler

// #7 10001st prime - Project Euler
// http://projecteuler.net/index.php?section=problems&id=7
import (
	"log"
	"projecteuler/my"
)

func P007() {
	log.Println(my.Primes(200000)[10000])
}

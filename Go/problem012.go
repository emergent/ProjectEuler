package projecteuler

// #12 Highly divisible triangular number - Project Euler
// http://projecteuler.net/index.php?section=problems&id=12
import (
	"log"
	"projecteuler/my"
)

func P012() {
	x := 0
	for i := 1; ; i++ {
		x += i
		fs := my.Factors(x)
		if len(fs) > 500 {
			log.Println(x)
			return
		}
	}
}

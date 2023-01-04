package projecteuler

// Problem 5 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=5
import (
	"log"
	"projecteuler/my"
)

func P005() {
	ans := 1
	for i := 2; i <= 20; i++ {
		ans = my.Lcm(ans, i)
	}
	log.Println(ans)
}

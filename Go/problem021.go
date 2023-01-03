package projecteuler

// #21 Amicable numbers - Project Euler
// http://projecteuler.net/index.php?section=problems&id=21
import (
	"fmt"
	"projecteuler/my"
)

func d(x int) int {
	divisors := my.Factors(x)
	sum := 0
	for _, v := range divisors {
		if v != x {
			sum += v
		}
	}
	return sum
}

func P021() {
	sum := 0
	for i := 2; i < 10000; i++ {
		di := d(i)
		if d(di) == i && i < di && di < 10000 {
			sum += i + di
		}
	}
	fmt.Println(sum)
}

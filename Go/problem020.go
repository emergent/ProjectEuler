package projecteuler

// #20 Factorial digit sum - Project Euler
// http://projecteuler.net/index.php?section=problems&id=20
import (
	"fmt"
	"projecteuler/my"
)

func P020() {
	n := my.NewBigInt(1)
	for i := 1; i <= 100; i++ {
		n = n.MulInt(i)
	}

	sum := 0
	for _, v := range n.Digits() {
		sum += v
	}

	fmt.Println(sum)
}

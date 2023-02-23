package projecteuler

// #25 1000-digit Fibonacci number - Project Euler
// http://projecteuler.net/index.php?section=problems&id=25
import (
	"fmt"
	"projecteuler/my"
)

func fibonacciDigits(x int) int {
	a, b := my.NewBigInt(1), my.NewBigInt(1)
	i := 1
	for ; ; i++ {
		if a.Len() >= x {
			break
		}
		a, b = b, a.Add(b)
	}

	return i
}

func P025() {
	ans := fibonacciDigits(1000)
	fmt.Println(ans)
}

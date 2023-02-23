package projecteuler

// #16 Power digit sum - Project Euler
// http://projecteuler.net/index.php?section=problems&id=16
import (
	"fmt"
	"projecteuler/my"
)

func P016() {
	ans := sumOfDigitsPower(2, 1000)
	fmt.Println(ans)
}

func sumOfDigitsPower(base, exp int) int {
	n := my.NewBigInt(1)
	for i := 0; i < exp; i++ {
		n = n.MulInt(base)
	}

	return sum(n.Digits())
}

func sum(arr []int) int {
	s := 0
	for _, v := range arr {
		s += v
	}
	return s
}

package projecteuler

// #30 Digit fifth powers - Project Euler
// http://projecteuler.net/index.php?section=problems&id=30
import "fmt"

func pow5(x int) int {
	return x * x * x * x * x
}

func P030() {
	ans := 0
	// 354294 = (9^5)*6
	for i := 2; i <= 354294; i++ {
		x := i
		sum_digits := 0
		for x > 0 {
			sum_digits += pow5(x % 10)
			x /= 10
		}
		if i == sum_digits {
			fmt.Println(i)
			ans += i
		}
	}

	fmt.Println(ans)
}

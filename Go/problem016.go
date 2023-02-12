package projecteuler

// #16 Power digit sum - Project Euler
// http://projecteuler.net/index.php?section=problems&id=16
import "fmt"

func P016() {
	ans := sumOfDigitsPower(2, 1000)
	fmt.Println(ans)
}

func sumOfDigitsPower(base, exp int) int {
	digits := []int{1}

	for i := 0; i < exp; i++ {
		carried := 0
		d_len := len(digits)
		for j := 0; j < d_len; j++ {
			carried, digits[j] = divmod(digits[j]*base+carried, 10)

			if j == d_len-1 {
				digits = append(digits, carried)
			}
		}
	}

	return sum(digits)
}

func divmod(x, y int) (int, int) {
	return x / y, x % y
}

func sum(arr []int) int {
	s := 0
	for _, v := range arr {
		s += v
	}
	return s
}

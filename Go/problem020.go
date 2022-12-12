package projecteuler

// #20 Factorial digit sum - Project Euler
// http://projecteuler.net/index.php?section=problems&id=20
import "fmt"

func P020() {
	digits := []int{1}
	for i := 1; i <= 100; i++ {
		carried := 0
		d_len := len(digits)

		for j := 0; j < d_len; j++ {
			d := digits[j]*i + carried

			digits[j] = d % 10
			carried = d / 10
			if j == d_len-1 {
				for carried > 0 {
					x := carried % 10
					digits = append(digits, x)
					carried /= 10
				}
			}
		}
	}

	sum := 0
	for _, v := range digits {
		sum += v
	}

	fmt.Println(sum)
}

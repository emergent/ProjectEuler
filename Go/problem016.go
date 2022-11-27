package projecteuler

// #16 Power digit sum - Project Euler
// http://projecteuler.net/index.php?section=problems&id=16
import "log"

func P016() {
	digits := []int{1}
	for i := 0; i < 1000; i++ {
		carried := 0
		d_len := len(digits)
		for j := 0; j < d_len; j++ {
			d := digits[j]*2 + carried
			if d >= 10 {
				digits[j] = d % 10
				carried = d / 10
				if j == d_len-1 {
					digits = append(digits, carried)
					carried = 0
				}
			} else {
				digits[j] = d
				carried = 0
			}
		}
	}

	sum := 0
	for _, v := range digits {
		sum += v
	}

	log.Println(sum)
}

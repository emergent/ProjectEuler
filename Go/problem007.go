package projecteuler

// #7 10001st prime - Project Euler
// http://projecteuler.net/index.php?section=problems&id=7
import "log"

func primes(max int) []int {
	marks := make([]bool, max+1)
	x := 2

	for i := x; i <= max; i++ {
		marks[i] = true
	}

	for ; x*x <= max; x++ {
		if !marks[x] {
			continue
		}

		y := x * 2
		for y <= max {
			marks[y] = false
			y += x
		}
	}

	var ans []int
	for i, b := range marks {
		if b {
			ans = append(ans, i)
		}
	}

	return ans
}

func P007() {
	log.Println(primes(200000)[10000])
}

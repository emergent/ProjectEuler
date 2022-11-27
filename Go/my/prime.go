package my

import "sort"

func Primes(max int) []int {
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

func Factors(x int) []int {
	fs := make([]int, 0)
	for i := 1; i*i <= x; i++ {
		if x%i == 0 {
			m := x / i
			fs = append(fs, i)
			if m != i {
				fs = append(fs, m)
			}
		}
	}

	return fs
}

func FactorsSorted(x int) []int {
	f := Factors(x)
	sort.Ints(f)
	return f
}

package projecteuler

// #32 Pandigital products - Project Euler
// http://projecteuler.net/index.php?section=problems&id=32
import "fmt"

func isPandigital(a, b, c int) bool {
	f := make([]bool, 10)

	for _, x := range []int{a, b, c} {
		for x > 0 {
			digit := x % 10
			if digit == 0 || f[digit] {
				return false
			}

			f[digit] = true
			x /= 10
		}
	}

	res := true
	for i := 1; i <= 9; i++ {
		res = res && f[i]
	}

	return res
}

func P032() {
	m := map[int]struct{}{}
	for i := 1; i < 1000; i++ {
		for j := i; j < 10000; j++ {
			if isPandigital(i, j, i*j) {
				m[i*j] = struct{}{}
			}
		}
	}

	ans := 0
	for k := range m {
		ans += k
	}
	fmt.Println(ans)
}

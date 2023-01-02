package projecteuler

// #49 Prime permutations - Project Euler
// http://projecteuler.net/index.php?section=problems&id=49
import (
	"fmt"
	"projecteuler/my"
	"sort"
)

func P049() {
	ps := my.Primes(10000)

	m := map[int]struct{}{}
	for _, p := range ps {
		if p >= 1000 {
			m[p] = struct{}{}
		}
	}

	ans := make([]int, 3)
L:
	for _, p := range ps {
		if p < 1000 {
			continue
		}
		count := 0
		ans[0] = p

		a := make([]int, 4)
		for i := 3; i >= 0 && p > 0; i-- {
			a[i] = p % 10
			p /= 10
		}

		x := sort.IntSlice(a)
		for my.NextPermutation(x) {
			num := x[0]*1000 + x[1]*100 + x[2]*10 + x[3]
			if num == p {
				continue
			}

			if _, ok := m[num]; ok {
				if num == ans[count]+3330 {
					count += 1
					ans[count] = num
				}
			}

			if count == 2 && ans[0] != 1487 {
				break L
			}
		}
	}

	for _, x := range ans {
		fmt.Print(x)
	}
	fmt.Println("")
}

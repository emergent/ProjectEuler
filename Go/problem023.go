package projecteuler

// #23 Non-abundant sums - Project Euler
// http://projecteuler.net/index.php?section=problems&id=23
import (
	"fmt"
	"projecteuler/my"
)

func P023() {
	abs := make([]int, 0)
	for i := 1; i <= 28123; i++ {
		fs := my.FactorsSorted(i)
		sum_fs := 0
		for _, f := range fs {
			if f != i {
				sum_fs += f
			}
		}

		if sum_fs > i {
			abs = append(abs, i)
		}
	}

	two_abs := make(map[int]struct{})
	for i := 0; i < len(abs); i++ {
		for j := 0; j < len(abs); j++ {
			two_abs[abs[i]+abs[j]] = struct{}{}
		}
	}

	ans := 0
	for i := 1; i < 28123; i++ {
		_, ok := two_abs[i]
		if !ok {
			ans += i
		}
	}

	fmt.Println(ans)
}

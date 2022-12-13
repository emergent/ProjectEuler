package projecteuler

// #24 Lexicographic permutations - Project Euler
// http://projecteuler.net/index.php?section=problems&id=24
import (
	"fmt"
	"sort"
)

func nextPermutation(x sort.Interface) bool {
	n := x.Len() - 1
	if n < 1 {
		return false
	}
	j := n - 1
	for ; !x.Less(j, j+1); j-- {
		if j == 0 {
			return false
		}
	}
	l := n
	for !x.Less(j, l) {
		l--
	}
	x.Swap(j, l)
	for k, l := j+1, n; k < l; {
		x.Swap(k, l)
		k++
		l--
	}
	return true
}

func P024() {
	v := []int{0, 1, 2, 3, 4, 5, 6, 7, 8, 9}
	for i := 2; i <= 1000000; i++ {
		nextPermutation(sort.IntSlice(v))
	}

	ans := 0
	d := 1
	for i := len(v) - 1; i >= 0; i-- {
		ans += v[i] * d
		d *= 10
	}
	fmt.Println(ans)
}

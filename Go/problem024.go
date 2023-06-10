package projecteuler

// #24 Lexicographic permutations - Project Euler
// http://projecteuler.net/index.php?section=problems&id=24
import (
	"fmt"
	"projecteuler/my"
	"sort"
)

func P024() {
	v := []int{0, 1, 2, 3, 4, 5, 6, 7, 8, 9}
	for i := 2; i <= 1000000; i++ {
		my.NextPermutation(sort.IntSlice(v))
	}

	ans := 0
	for _, x := range v {
		ans = ans*10 + x
	}

	fmt.Println(ans)
}

package projecteuler

// #36 Double-base palindromes - Project Euler
// http://projecteuler.net/index.php?section=problems&id=36
import (
	"fmt"
	"reflect"
)

func isPalindromic(base, x int) bool {
	v1 := []int{}
	v2 := []int{}

	for x > 0 {
		v1 = append(v1, x%base)
		v2 = append([]int{x % base}, v2...)
		x /= base
	}

	return reflect.DeepEqual(v1, v2)
}

func isPalindromic2Base(x int) bool {
	return isPalindromic(10, x) && isPalindromic(2, x)
}

func P036() {
	ans := 0
	for i := 1; i < 1_000_000; i++ {
		if isPalindromic2Base(i) {
			ans += i
		}
	}
	fmt.Println(ans)
}

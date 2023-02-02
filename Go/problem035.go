package projecteuler

// #35 Circular primes - Project Euler
// http://projecteuler.net/index.php?section=problems&id=35
import (
	"fmt"
	"projecteuler/my"
)

func rot(x int) int {
	v := []int{}
	for x > 0 {
		v = append(v, x%10)
		x /= 10
	}

	ret := 0
	n := 1
	for i := 1; i < len(v); i++ {
		ret += v[i] * n
		n *= 10
	}
	ret += v[0] * n

	return ret
}

func isCircularPrime(primeSet map[int]struct{}, p int) bool {
	pi := rot(p)
	if pi == p {
		return true
	}

	for ; pi != p; pi = rot(pi) {
		_, ok := primeSet[pi]
		if !ok {
			return false
		}
	}

	return true
}

func P035() {
	ps := my.Primes(1000_000)
	set := map[int]struct{}{}
	for _, p := range ps {
		set[p] = struct{}{}
	}

	count := 0
	for _, p := range ps {
		if isCircularPrime(set, p) {
			count += 1
		}
	}

	fmt.Println(count)
}

package projecteuler

// #37 Truncatable primes - Project Euler
// http://projecteuler.net/index.php?section=problems&id=37
import (
	"fmt"
	"projecteuler/my"
)

type MyPrimes struct {
	primeSet map[int]struct{}
}

func (mp *MyPrimes) isPrime(p int) bool {
	if mp == nil {
		return false
	}

	_, ok := mp.primeSet[p]
	return ok
}

func (mp *MyPrimes) truncatablePrime(p int) bool {
	if mp == nil {
		return false
	}

	filter := 1
	x := p
	for x > 0 {
		x /= 10
		filter *= 10
		if x > 0 && !mp.isPrime(x) {
			return false
		}
	}

	for filter > 0 {
		p %= filter
		if p > 0 && !mp.isPrime(p) {
			return false
		}
		filter /= 10
	}

	return true
}

func P037() {
	ans := 0
	count := 0

	ps := my.Primes(2_000_000)
	set := map[int]struct{}{}
	for _, p := range ps {
		set[p] = struct{}{}
	}
	mp := MyPrimes{primeSet: set}

	for i := 4; i < len(ps); i++ {
		if mp.truncatablePrime(ps[i]) {
			ans += ps[i]
			count += 1
			if count == 11 {
				break
			}
		}
	}

	fmt.Println(ans)
}

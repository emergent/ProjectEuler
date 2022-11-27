package projecteuler

// #14 Longest Collatz sequence - Project Euler
// http://projecteuler.net/index.php?section=problems&id=14
import (
	"log"
)

var memo = map[int]int{}

func collatz(x int) int {
	if x == 1 {
		return 1
	}

	v, ok := memo[x]
	if ok {
		return v
	} else {
		n := 0
		if x%2 == 0 {
			n = collatz(x / 2)
		} else {
			n = collatz(x*3 + 1)
		}
		memo[x] = n + 1
		return n + 1
	}
}

func P014() {
	ans := 0
	count_max := 0
	for i := 1; i < 1000000; i++ {
		n := collatz(i)
		if n > count_max {
			count_max = n
			ans = i
		}
	}

	log.Println(ans)
}

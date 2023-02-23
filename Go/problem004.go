package projecteuler

import (
	"log"
	"strconv"
)

// Problem 4 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=4

func isPalindromic(x int) bool {
	s := strconv.Itoa(x)
	length := len(s)
	for i := 0; i < length/2; i++ {
		if s[i] != s[length-i-1] {
			return false
		}
	}
	return true
}

func P004() {
	ans := 0
	for i := 100; i < 1000; i++ {
		for j := i; j < 1000; j++ {
			x := i * j
			if ans < x && isPalindromic(x) {
				ans = x
			}
		}
	}
	log.Println(ans)

}

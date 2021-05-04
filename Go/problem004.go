package main

import (
	"fmt"
	"strconv"
)

// Problem 4 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=4

func is_palindromic(x int) bool {
	s := strconv.Itoa(x)
	length := len(s)
	for i := 0; i < length/2; i++ {
		if s[i] != s[length-i-1] {
			return false
		}
	}
	return true
}

func main() {
	ans := 0
	for i := 100; i < 1000; i++ {
		for j := i; j < 1000; j++ {
			x := i * j
			if ans < x && is_palindromic(x) {
				ans = x
			}
		}
	}
	fmt.Println(ans)

}

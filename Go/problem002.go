package main

// Problem 2 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=2

import "fmt"

func fibevensum2(a int32, b int32, sum int32, xmax int32) int32 {
	switch {
	case a >= xmax:
		return sum
	case a%2 == 0:
		return fibevensum2(b, a+b, sum+a, xmax)
	default:
		return fibevensum2(b, a+b, sum, xmax)
	}
}

func fibevensum(xmax int32) int32 {
	return fibevensum2(1, 2, 0, xmax)
}

func main() {
	fmt.Println(fibevensum(4000000))
}

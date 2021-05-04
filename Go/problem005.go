package main

// Problem 5 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=5
import "fmt"

func gcd(x, y int) int {
	if y == 0 {
		return x
	}
	return gcd(y, x%y)
}

func lcm(x, y int) int {
	return x * y / gcd(x, y)
}

func main() {
	ans := 1
	for i := 2; i <= 20; i++ {
		ans = lcm(ans, i)
	}
	fmt.Println(ans)
}

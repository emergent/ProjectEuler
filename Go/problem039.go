package projecteuler

// #39 Integer right triangles - Project Euler
// http://projecteuler.net/problem=39
import "fmt"

func countTriangles(x int) int {
	count := 0

	for a := 1; a < x; a++ {
		for b := a; b < x-a; b++ {
			c := x - a - b
			if a*a+b*b == c*c {
				count++
			}
		}
	}

	return count
}

func P039() {
	init := 3 + 4 + 5
	max := 1
	maxP := init

	for i := init; i <= 1000; i++ {
		count := countTriangles(i)
		if count > max {
			max = count
			maxP = i
		}
	}

	fmt.Println(maxP)
}

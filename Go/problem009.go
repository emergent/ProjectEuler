package projecteuler

import "fmt"

// #9 Special Pythagorean triplet - Project Euler
// http://projecteuler.net/index.php?section=problems&id=9

func P009() {
	for a := 1; a < 1000; a++ {
		for b := a; b < 1000; b++ {
			c := 1000 - a - b
			if c <= b {
				break
			}
			if a*a+b*b == c*c {
				fmt.Println(a * b * c)
				return
			}
		}
	}
}

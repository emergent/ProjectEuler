package projecteuler

// #33 Digit cancelling fractions - Project Euler
// http://projecteuler.net/index.php?section=problems&id=33
import (
	"fmt"
	"projecteuler/my"
)

func a2d(a []int) int {
	return a[0]*10 + a[1]
}

func isCancellingFraction(ns, ds []int) bool {
	orig_n := a2d(ns)
	orig_d := a2d(ds)

	for i := 0; i < 2; i++ {
		for j := 0; j < 2; j++ {
			if ns[i] == ds[j] && ns[1-i]*orig_d == orig_n*ds[1-j] {
				return true
			}
		}
	}

	return false
}

func P033() {
	var n1, n2, d1, d2 int
	prod_n := 1 // product of numerator
	prod_d := 1 // product of denominator

	for n1 = 1; n1 < 10; n1++ {
		for n2 = 1; n2 < 10; n2++ {
			for d1 = 1; d1 < 10; d1++ {
				for d2 = 1; d2 < 10; d2++ {
					ns := []int{n1, n2}
					ds := []int{d1, d2}

					if a2d(ns) >= a2d(ds) {
						continue
					}

					if isCancellingFraction(ns, ds) {
						fmt.Println(a2d(ns), "/", a2d(ds))

						prod_n *= a2d(ns)
						prod_d *= a2d(ds)
					}
				}
			}
		}
	}

	fmt.Println("product:", prod_n, "/", prod_d)
	ans := prod_d / my.Gcd(prod_n, prod_d)
	fmt.Println("ans =", ans)
}

package projecteuler

// #29 Distinct powers - Project Euler
// http://projecteuler.net/index.php?section=problems&id=29
import (
	"fmt"
	"math/big"
)

func PowString(a, b int) string {
	bigA := big.NewInt(int64(a))
	bigB := big.NewInt(int64(b))
	p := bigA.Exp(bigA, bigB, nil)
	return p.String()
}

func P029() {
	set := map[string]struct{}{}

	for i := 2; i <= 100; i++ {
		for j := 2; j <= 100; j++ {
			val := PowString(i, j)
			set[val] = struct{}{}
		}
	}

	fmt.Println(len(set))
}

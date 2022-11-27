package projecteuler

// #15 Lattice paths - Project Euler
// http://projecteuler.net/index.php?section=problems&id=15
import "log"

func P015() {
	n := 40
	k := 20

	c := make([][]int64, n+1)
	for i := 0; i <= n; i++ {
		c[i] = make([]int64, n+1)
		for j := 0; j <= i; j++ {
			if i == 0 || j == 0 {
				c[i][j] = 1
			} else {
				c[i][j] = c[i-1][j-1] + c[i-1][j]
			}
		}
	}

	log.Println(c[n][k])
}

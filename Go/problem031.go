package projecteuler

// #31 Coin sums - Project Euler
// http://projecteuler.net/index.php?section=problems&id=31
import "fmt"

func dfs(m []int, rest, idx int) int {
	if idx == len(m)-1 || rest == 0 {
		return 1
	}

	count := 0
	for i := 0; rest-i*m[idx] >= 0; i++ {
		count += dfs(m, rest-i*m[idx], idx+1)
	}
	return count
}

func P031() {
	m := []int{200, 100, 50, 20, 10, 5, 2, 1}
	count := dfs(m, 200, 0)
	fmt.Println(count)
}

package projecteuler

// #25 1000-digit Fibonacci number - Project Euler
// http://projecteuler.net/index.php?section=problems&id=25
import "fmt"

func add(x, y []int) []int {
	if len(x) > len(y) {
		x, y = y, x
	}

	z := make([]int, 0)

	carried := 0
	for i := 0; i < len(y); i++ {
		w := y[i] + carried
		if i < len(x) {
			w += x[i]
		}
		z = append(z, w%10)
		carried = w / 10
	}

	if carried > 0 {
		z = append(z, carried)
	}

	return z
}

func fibonacciDigits(x int) int {
	a, b := []int{1}, []int{1}
	i := 1
	for ; ; i++ {
		if len(a) >= x {
			break
		}
		a, b = b, add(a, b)
	}

	return i
}

func P025() {
	ans := fibonacciDigits(1000)
	fmt.Println(ans)
}

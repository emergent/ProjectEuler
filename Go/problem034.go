package projecteuler

// #34 Digit factorials - Project Euler
// http://projecteuler.net/index.php?section=problems&id=34
import "fmt"

func P034() {
	fs := [10]int{}
	fs[0] = 1
	for i := 1; i < len(fs); i++ {
		fs[i] = i * fs[i-1]
	}

	ans := 0
	for i := 10; i < fs[9]*7; i++ {
		sum := 0
		for x := i; x > 0; x /= 10 {
			sum += fs[x%10]
		}

		if sum == i {
			ans += i
		}
	}

	fmt.Println(ans)
}

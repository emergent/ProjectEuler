package projecteuler

// #18 Maximum path sum I - Project Euler
// http://projecteuler.net/index.php?section=problems&id=18
import (
	"log"
	"projecteuler/my"
	"strconv"
	"strings"
)

var str18 = `
75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
`

func P018() {
	s := strings.Split(strings.TrimSpace(str18), "\n")
	v := [][]int{}
	for _, ss := range s {
		vs := []int{}
		for _, ns := range strings.Split(ss, " ") {
			i, err := strconv.ParseInt(ns, 10, 64)
			if err != nil {
				panic(err)
			}
			vs = append(vs, int(i))
		}
		v = append(v, vs)
	}

	length := len(v)
	dp := make([][]int, length)
	for i := 0; i < length; i++ {
		dp[i] = make([]int, length)
	}

	dp[0][0] = v[0][0]
	for i := 0; i < length-1; i++ {
		for j := range v[i] {
			dp[i+1][j] = my.Max(dp[i+1][j], dp[i][j]+v[i+1][j])
			dp[i+1][j+1] = my.Max(dp[i+1][j+1], dp[i][j]+v[i+1][j+1])
		}
	}

	ans := 0
	for _, val := range dp[length-1] {
		ans = my.Max(ans, val)
	}
	log.Println(ans)
}

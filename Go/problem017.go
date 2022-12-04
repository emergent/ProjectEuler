package projecteuler

// #17 Number letter counts - Project Euler
// http://projecteuler.net/index.php?section=problems&id=17
import (
	"log"
	"strings"
)

func P017() {
	s1to9 := len(strings.Join([]string{"one", "two", "three", "four", "five", "six", "seven", "eight", "nine"}, ""))
	s10to19 := len(strings.Join([]string{"ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"}, ""))
	s20to99 := len(strings.Join([]string{"twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"}, ""))*10 + s1to9*8

	s1to99 := s1to9 + s10to19 + s20to99

	hundred := len("hundred")
	and := len("and")

	s100to999 := s1to9*100 + (hundred*100+and*99+s1to99)*9
	s1000 := len(strings.Join([]string{"one", "thousand"}, ""))

	ans := s1to99 + s100to999 + s1000

	log.Println(ans)
}

package projecteuler

// #22 Names scores - Project Euler
// http://projecteuler.net/index.php?section=problems&id=22
import (
	"encoding/csv"
	"fmt"
	"io"
	"os"
	"sort"
)

func P022() {
	fp, err := os.Open("p022_names.txt")
	if err != nil {
		panic(err)
	}
	defer fp.Close()

	ans := 0
	reader := csv.NewReader(fp)
	for {
		record, err := reader.Read()
		if err == io.EOF {
			break
		} else if err != nil {
			panic(err)
		}

		sort.Strings(record)
		for i, name := range record {
			tmp := 0
			for _, c := range name {
				tmp += int(c - 'A' + 1)
			}
			ans += (i + 1) * tmp
		}
	}

	fmt.Println(ans)
}

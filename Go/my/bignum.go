package my

import (
	"reflect"
)

type BigInt struct {
	inner []int
}

func NewBigInt(x int) *BigInt {
	inner := []int{}
	for {
		inner = append(inner, x%10)
		x /= 10
		if x <= 0 {
			break
		}
	}
	return &BigInt{inner}
}

func (bi *BigInt) Equal(rhs *BigInt) bool {
	if bi == nil || rhs == nil {
		return false
	}
	return reflect.DeepEqual(bi.inner, rhs.inner)
}

func (bi *BigInt) Len() int {
	if bi == nil {
		return 0
	}
	return len(bi.inner)
}

func (bi *BigInt) Digits() []int {
	if bi == nil {
		return []int{}
	}
	return bi.inner
}

func (bi *BigInt) Add(rhs *BigInt) *BigInt {
	if bi == nil {
		return nil
	}
	if rhs == nil {
		return bi
	}

	l_len := len(bi.inner)
	r_len := len(rhs.inner)
	carried := 0
	for i := 0; i < l_len; i++ {
		if i < r_len {
			d := bi.inner[i] + rhs.inner[i] + carried
			bi.inner[i] = d % 10
			carried = d / 10
		} else {
			d := bi.inner[i] + carried
			bi.inner[i] = d % 10
			carried = d / 10
		}
	}

	for i := l_len; i < r_len; i++ {
		d := rhs.inner[i] + carried
		bi.inner = append(bi.inner, d%10)
		carried = d / 10
	}

	for carried > 0 {
		bi.inner = append(bi.inner, carried%10)
		carried /= 10
	}

	return bi
}

func (bi *BigInt) MulInt(rhs int) *BigInt {
	if bi == nil {
		return nil
	}

	l_len := len(bi.inner)
	carried := 0
	for i := 0; i < l_len; i++ {
		d := bi.inner[i]*rhs + carried
		bi.inner[i] = d % 10
		carried = d / 10
	}

	for carried > 0 {
		bi.inner = append(bi.inner, carried%10)
		carried /= 10
	}

	return bi

}

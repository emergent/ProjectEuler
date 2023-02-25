package my

import "testing"

func helperInit(l, expect int, t *testing.T) {
	b := NewBigInt(l)
	if !(b.Len() == expect) {
		t.Errorf("Initial length of %v == %v, want = %v", l, b.Len(), expect)
	}
}

func TestInit(t *testing.T) {
	helperInit(0, 1, t)
	helperInit(1, 1, t)
	helperInit(1000, 4, t)
}

func helperAdd(l, r, expect int, t *testing.T) {
	bl := NewBigInt(l)
	br := NewBigInt(r)
	be := NewBigInt(expect)
	bl = bl.Add(br)
	if !bl.Equal(be) {
		t.Errorf("Addition of %v,%v = %v, want = %v", l, r, l+r, expect)
	}
}

func TestAdd(t *testing.T) {
	helperAdd(1, 2, 3, t)
	helperAdd(9, 2, 11, t)
	helperAdd(99, 2, 101, t)
	helperAdd(999, 2, 1001, t)

	helperAdd(222, 222, 444, t)
	helperAdd(777, 333, 1110, t)

	helperAdd(2, 9, 11, t)
	helperAdd(2, 99, 101, t)
	helperAdd(2, 999, 1001, t)
}

func helperMulInt(l, r, expect int, t *testing.T) {
	bl := NewBigInt(l)
	be := NewBigInt(expect)
	bl = bl.MulInt(r)
	if !bl.Equal(be) {
		t.Errorf("Multiplication of %v,%v = %v, want = %v", l, r, l+r, expect)
	}
}

func TestMulInt(t *testing.T) {
	helperMulInt(1, 1, 1, t)
	helperMulInt(1, 2, 2, t)
	helperMulInt(2, 2, 4, t)
	helperMulInt(16, 16, 256, t)
	helperMulInt(9, 12345679, 111111111, t)
}

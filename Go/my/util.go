package my

func Max(x, y int) int {
	if x > y {
		return x
	} else {
		return y
	}
}

func Min(x, y int) int {
	if x < y {
		return x
	} else {
		return y
	}
}

func Gcd(x, y int) int {
	if y == 0 {
		return x
	}
	return Gcd(y, x%y)
}

func Lcm(x, y int) int {
	return x * y / Gcd(x, y)
}

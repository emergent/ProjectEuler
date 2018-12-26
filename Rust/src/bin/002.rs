/// Problem 2 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=2

fn fibevensum2(a: i32, b: i32, sum: i32, xmax: i32) -> i32 {
    if a >= xmax {
        return sum;
    } else if a % 2 == 0 {
        return fibevensum2(b, a+b, sum+a, xmax);
    } else {
        return fibevensum2(b, a+b, sum, xmax);
    }
}

fn fibevensum(xmax: i32) -> i32 {
    fibevensum2(1, 2, 0, xmax)
}

fn main() {
    println!("{}", fibevensum(4000000))
}

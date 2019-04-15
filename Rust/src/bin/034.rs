/// Problem 34 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=34
fn fac(x: i32) -> i32 {
    match x {
        0 => 1,
        _ => x * fac(x - 1),
    }
}

fn facdigits(x: i32) -> i32 {
    let mut xd = x;
    let mut sum = 0;
    while xd != 0 {
        sum += fac(xd % 10);
        xd = xd / 10;
    }
    sum
}

fn main() {
    let ans: i32 = (3..(fac(9) * 7)).filter(|&i| i == facdigits(i)).sum();
    println!("{}", ans);
}

/// Problem 34 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=34
fn fac(x: i32) -> i32 {
    match x {
        0 => 1,
        _ => x * fac(x-1),
    }
}

fn main() {
    let ans: i32 = (3..(fac(9)*7)).filter(|&i|
        i == i.to_string()
                .chars()
                .fold(0, |sum, c| sum + fac(c as i32 - 48))
    ).sum();
    println!("{}", ans);
}

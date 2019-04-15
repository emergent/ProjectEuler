/// Problem 36 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=36

fn dec2bin(x: i32) -> String {
    let mut xd = x;
    let mut s = String::new();
    let mut r;

    while xd > 0 {
        r = xd % 2;
        s.push_str(&r.to_string());
        xd = xd / 2;
    }
    s.chars().rev().collect::<String>()
}

fn main() {
    let ans = (1..(1_000_000 - 1))
        .step_by(2)
        .filter(|&x| {
            x == x
                .to_string()
                .chars()
                .rev()
                .collect::<String>()
                .parse()
                .unwrap()
        })
        .filter(|&x| dec2bin(x) == dec2bin(x).chars().rev().collect::<String>())
        .fold(0, |sum, x| sum + x);
    println!("{}", ans)
}

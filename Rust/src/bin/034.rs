/// Problem 34 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=34
fn facdigits(fs: &[i32], x: i32) -> i32 {
    let mut xd = x;
    let mut sum = 0;
    while xd != 0 {
        sum += fs[(xd % 10) as usize];
        xd /= 10;
    }
    sum
}

fn main() {
    let mut fs = [1; 10];
    for i in 1..=9 {
        fs[i] = fs[i - 1] * i as i32;
    }

    let ans: i32 = (3..(fs[9] * 7)).filter(|&i| i == facdigits(&fs, i)).sum();
    println!("{}", ans);
}

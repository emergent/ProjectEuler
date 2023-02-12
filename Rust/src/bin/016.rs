/// Problem 16 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=16
fn sum_of_digits_power(base: u32, exp: usize) -> u32 {
    let mut digits = vec![1];

    for _ in 0..exp {
        let mut carried = 0;

        for i in 0..digits.len() {
            (carried, digits[i]) = divmod(digits[i] * base + carried, 10);

            if i == digits.len() - 1 && carried > 0 {
                digits.push(carried);
            }
        }
    }

    digits.into_iter().sum()
}

fn divmod(x: u32, y: u32) -> (u32, u32) {
    (x / y, x % y)
}

fn main() {
    println!("{}", sum_of_digits_power(2, 1000));
}

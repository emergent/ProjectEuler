/// Problem 28 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=28
fn sum_diagonals_n_by_n_spiral(x: i32) -> i32 {
    (1..x + 1)
        .step_by(2)
        .map(|i| i * i * 4 - i * 6 + 6)
        .sum::<i32>()
        - 3
}
fn main() {
    println!("{}", sum_diagonals_n_by_n_spiral(1001));
}

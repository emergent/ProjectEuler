/// Problem 4 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=4

fn is_palindromic(x: i32) -> bool{
    let rev = x.to_string()
                .chars()
                .rev()
                .collect::<String>();
    x.to_string() == rev
}

fn main() {
    let mut pmax = 0;
    for i in 100..1000 {
        for j in i..1000 {
            if is_palindromic(i*j) {
                pmax = std::cmp::max(i*j, pmax);
            }
        }
    }
    println!("{}", pmax);
}

/// Problem 2 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=2

fn fibevensum(term_max: i32) -> i32 {
    let mut a = 1;
    let mut b = 2;
    let mut tmp;
    let mut sum = 0;
    
    while a < term_max {
        if a % 2 == 0 {
            sum += a;
        }
        tmp = b;
        b = a + b;
        a = tmp;
    }

    sum
}

fn main() {
    println!("{}", fibevensum(4000000))
}

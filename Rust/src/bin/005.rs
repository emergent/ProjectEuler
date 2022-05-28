/// Problem 5 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=5

fn main() {
    println!("{}", (1..20).fold(1, num::integer::lcm));
}

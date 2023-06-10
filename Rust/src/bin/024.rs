/// Problem 24 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=24
use permutohedron::LexicalPermutation;

fn main() {
    let mut data = (0..=9).collect::<Vec<_>>();
    for _ in 0..1_000_000 - 1 {
        data.next_permutation();
    }

    let mut ans = 0u64;
    for x in data {
        ans = ans * 10 + x;
    }

    println!("{}", ans);
}

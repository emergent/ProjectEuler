/// Problem 31 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=31
use derive_new::new;

fn main() {
    let coins = vec![200, 100, 50, 20, 10, 5, 2, 1];
    let mut p = Pattern::new(0, coins);
    p.count(200, 0);
    println!("{}", p.ans);
}

#[derive(new)]
struct Pattern {
    ans: usize,
    coins: Vec<u64>,
}

impl Pattern {
    fn count(&mut self, rest: u64, d: usize) {
        if rest == 0 || d == self.coins.len() - 1 {
            self.ans += 1;
            return;
        }

        let mut i = 0;
        while i * self.coins[d] <= rest {
            self.count(rest - i * self.coins[d], d + 1);
            i += 1;
        }
    }
}

use project_euler::prime::primes;
use std::collections::{HashMap, HashSet};

/// #51 Prime digit replacements - Project Euler
/// http://projecteuler.net/problem=51
fn main() {
    const MAX: u64 = 1_000_000;
    const COUNT: usize = 8;
    let ps = primes(MAX);

    let mut ans = MAX;
    for digits in 2..=6 {
        if let Some(a) = calc(&ps, digits, COUNT) {
            ans = std::cmp::min(ans, a);
        }

        if ans < MAX {
            break;
        }
    }

    println!("{}", ans);
}

fn calc(ps: &[u64], digits: usize, count: usize) -> Option<u64> {
    let max = make_max(digits);
    let mut ans = None;
    let masks = make_masks(digits);

    let ps = ps
        .iter()
        .filter(|&&x| max / 10 <= x && x < max)
        .cloned()
        .collect::<Vec<_>>();

    for mut mask in masks {
        loop {
            let mut hm = HashMap::new();

            for p in ps.clone() {
                let p2 = digitize(p);
                let x2 = mask.clone();

                let mut vv = vec![];
                for i in 0..x2.len() {
                    if x2[i] == 0 {
                        vv.push(p2[i]);
                    }
                }
                let vs = vv.into_iter().collect::<HashSet<_>>();
                if vs.len() != 1 {
                    continue;
                }

                let nv = p2
                    .into_iter()
                    .zip(x2)
                    .map(|y| y.0 * y.1)
                    .collect::<Vec<_>>();
                let nu = concat(&nv);

                let c = hm.entry(nu).or_insert((0, p));
                c.0 += 1;
                c.1 = std::cmp::min(c.1, p);

                if c.0 >= count {
                    ans = ans.map(|a| std::cmp::min(a, c.1)).or(Some(c.1));
                }
            }

            if !next_permutation(&mut mask) {
                break;
            }
        }
    }

    ans
}

fn make_max(digits: usize) -> u64 {
    let mut x = 1;
    for _ in 0..digits {
        x *= 10;
    }
    x
}

fn make_masks(digits: usize) -> Vec<Vec<u64>> {
    let mut v = vec![];
    for i in 1..digits {
        let mut vi = vec![0; digits];
        for vij in vi.iter_mut().take(digits).skip(i) {
            *vij = 1;
        }
        v.push(vi);
    }
    v
}

pub fn next_permutation<T: Ord>(sequence: &mut [T]) -> bool {
    if sequence.len() < 2 {
        return false;
    }

    let mut i = sequence.len() - 1;
    while i > 0 && sequence[i - 1] >= sequence[i] {
        i -= 1;
    }

    if i == 0 {
        return false;
    }

    let mut j = sequence.len() - 1;
    while sequence[j] <= sequence[i - 1] {
        j -= 1;
    }

    sequence.swap(i - 1, j);

    sequence[i..].reverse();

    true
}

fn digitize(mut x: u64) -> Vec<u64> {
    let mut v = vec![];
    while x > 0 {
        v.push(x % 10);
        x /= 10;
    }
    v
}

fn concat(v: &[u64]) -> u64 {
    let mut ret = 0;
    let mut d = 1;
    for vi in v {
        ret += vi * d;
        d *= 10;
    }
    ret
}

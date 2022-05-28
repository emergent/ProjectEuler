/// Problem 49 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=49
use itertools::Itertools;
use project_euler::prime::primes;

fn sorted_str(x: u64) -> String {
    x.to_string().chars().sorted().collect::<String>()
}

fn same_digits(x: u64, y: u64, z: u64) -> bool {
    sorted_str(x) == sorted_str(y) && sorted_str(y) == sorted_str(z)
}

fn main() {
    let ps = primes(9999);
    let mut v = Vec::new();

    for &p in &ps {
        let p2: u64 = p + 3330;
        let p3: u64 = p + 3330 * 2;
        if ps.contains(&p2) && ps.contains(&p3) && same_digits(p, p2, p3) {
            v.push(vec![p, p2, p3]);
        }
    }

    let vstr = v
        .iter()
        .map(|pset| {
            pset.iter()
                .map(|u| u.to_string())
                .collect::<Vec<String>>()
                .join("")
        })
        .collect::<Vec<String>>();
    println!("{:?}", vstr);
}

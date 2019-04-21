/// Problem 58 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=58
extern crate project_euler;
use project_euler::prime::is_prime;

fn wrap(n: u32) -> (u32, Vec<u32>) {
    if n == 0 {
        return (1, vec![1]);
    }
    let side = 2 * (n + 1) - 1;
    let vertex = vec![
        side * (side - 3) + 3,
        side * (side - 2) + 2,
        side * (side - 1) + 1,
        side * side,
    ];
    (side, vertex)
}

fn main() {
    let mut v = vec![false]; // 1
    for i in 1.. {
        let (side, vs) = wrap(i);
        let vs_b = vs
            .iter()
            .map(|&p| is_prime(p.into()))
            .collect::<Vec<bool>>();
        v.extend(vs_b.iter().cloned());
        let len = v.len();
        let pcount = v.iter().filter(|&&b| b).count();

        if pcount * 10 < len {
            println!("{}, ({} / {})", side, pcount, len);
            break;
        }
    }
}

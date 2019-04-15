/// Problem 44 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=44
fn is_penta(y: i32) -> bool {
    let d = 1 + 24 * y;
    let d_sq = (d as f64).sqrt() as i32;

    d_sq * d_sq == d && (d_sq + 1) % 6 == 0
}

fn penta(n: i32) -> i32 {
    n * (3 * n - 1) / 2
}

fn main() {
    for k in 2.. {
        for j in 1..k {
            let pk = penta(k);
            let pj = penta(j);
            if is_penta(pk - pj) && is_penta(pk + pj) {
                println!("D = |Pk - Pj| = |{} - {}| = {}", pk, pj, (pk - pj).abs());
                return;
            }
        }
    }
}

#[test]
fn test_is_penta() {
    for i in 1..120 {
        match i {
            1 | 5 | 12 | 22 | 35 | 51 | 70 | 92 | 117 => assert_eq!(is_penta(i), true),
            _ => assert_eq!(is_penta(i), false),
        }
    }
}

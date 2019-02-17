/// Problem 44 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=44

fn is_penta(y: i32) -> bool {
    let d = 1 + 24 * y;
    let d_sq = (d as f64).sqrt() as i32;

    if d_sq * d_sq == d && (d_sq + 1) % 6 == 0 {
        return true;
    }
    false
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
                println!("{}", (pk - pj).abs());
                return;
            }
        }
    }
}

#[test]
fn test_is_penta() {
    assert_eq!(is_penta(1), true);
    assert_eq!(is_penta(5), true);
    assert_eq!(is_penta(12), true);
    assert_eq!(is_penta(22), true);
    assert_eq!(is_penta(35), true);
    assert_eq!(is_penta(51), true);
    assert_eq!(is_penta(70), true);
    assert_eq!(is_penta(92), true);
    assert_eq!(is_penta(117), true);

    assert_eq!(is_penta(2), false);
    assert_eq!(is_penta(4), false);
    assert_eq!(is_penta(10), false);
    assert_eq!(is_penta(23), false);
    assert_eq!(is_penta(40), false);
    assert_eq!(is_penta(52), false);
    assert_eq!(is_penta(100), false);
}

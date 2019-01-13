/// Problem 3 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=3

fn maxprimefactor(x: i64) -> i64 {
    let mut divider = 2;
    let mut target = x;

    while target != 1 {
        if target % divider == 0 {
            target /= divider;
        } else {
            divider += 1;
        }
    }
    divider
}

#[test]
fn test_maxprimefactor() {
    assert_eq!(maxprimefactor(2),  2);
    assert_eq!(maxprimefactor(3),  3);
    assert_eq!(maxprimefactor(10), 5);
    assert_eq!(maxprimefactor(16), 2);
}

fn main() {
    println!("{}", maxprimefactor(600851475143))
}

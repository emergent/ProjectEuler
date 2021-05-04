/// Problem 3 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=3

fn maxprimefactor(mut x: i64) -> i64 {
    for i in 2.. {
        if i == x {break}
        while x % i == 0 {
            x /= i;
        }
    }
    x
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

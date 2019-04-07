/// Problem 12 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=12
fn triangle(n: i32) -> i32 {
    n * (n + 1) / 2
}

fn divisors(x: i32) -> i32 {
    let mut xd = x;
    let mut d  = 2;
    let mut v  = Vec::new();
    let mut counter = 0;

    while xd > 1 {
        if xd % d == 0 {
            counter += 1;
            xd = xd / d;
        }
        if xd % d != 0 || xd == 1 {
            if counter > 0 {
                v.push(counter + 1);
                counter = 0
            }
            d = if d == 2 { 3 } else { d + 2 };
        }
    }
    v.iter().fold(1, |prod, x| prod * x)
}

fn main() {
    let mut i = 0;
    while divisors(triangle(i)) <= 500 {
        i += 1;
    }
    println!("{}", triangle(i));
}

#[test]
fn test_triangle() {
    assert_eq!(triangle(1), 1);
    assert_eq!(triangle(2), 3);
    assert_eq!(triangle(7), 28);
}

#[test]
fn test_divisors() {
    assert_eq!(divisors(1), 1);
    assert_eq!(divisors(2), 2);
    assert_eq!(divisors(3), 2);
    assert_eq!(divisors(28), 6);
}

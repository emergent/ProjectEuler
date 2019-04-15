/// Problem 52 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=52
fn digits_to_vec_sorted(n: i32) -> Vec<i32> {
    let mut v = Vec::new();
    let mut x = n;
    while x != 0 {
        v.push(x % 10);
        x = x / 10;
    }
    v.sort();
    v
}

fn has_same_digits(m: i32, n: i32) -> bool {
    let mut mv = digits_to_vec_sorted(m);
    let mut nv = digits_to_vec_sorted(n);

    while mv.len() > 0 {
        if mv.pop() != nv.pop() {
            return false;
        }
    }
    true
}

fn main() {
    let mut n = 100000;
    loop {
        let mut same = true;
        for i in 2..6 {
            same = same & has_same_digits(n, n * i);
        }
        if same {
            println!("{}", n);
            break;
        } else {
            n += 1;
        }
    }
}

#[test]
fn test_digits_to_vec_sorted() {
    assert_eq!(digits_to_vec_sorted(123), [1, 2, 3]);
    assert_eq!(digits_to_vec_sorted(321), [1, 2, 3]);
    assert_eq!(digits_to_vec_sorted(213), [1, 2, 3]);
    assert_eq!(digits_to_vec_sorted(492), [2, 4, 9]);
}

#[test]
fn test_has_same_digits() {
    assert_eq!(has_same_digits(123, 312), true);
    assert_eq!(has_same_digits(123, 313), false);
}

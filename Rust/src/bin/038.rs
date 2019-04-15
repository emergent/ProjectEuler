/// Problem 38 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=38
use std::collections::HashSet;

fn is_pandigital_9digits(x: u32) -> bool {
    let digits: HashSet<u32> = (1..=9).collect();
    x.to_string()
        .chars()
        .map(|c| c as u32 - 48)
        .collect::<HashSet<u32>>()
        .symmetric_difference(&digits)
        .collect::<HashSet<_>>()
        .is_empty()
}

fn main() {
    let mut max = 918273645;
    for i in 9183..10000 {
        let ps = [i, i * 2]
            .iter()
            .map(i32::to_string)
            .collect::<String>()
            .parse::<u32>()
            .unwrap();
        if is_pandigital_9digits(ps) {
            max = std::cmp::max(max, ps);
        }
    }
    println!("{}", max);
}

#[test]
fn test_ip9() {
    assert_eq!(is_pandigital_9digits(123456789), true);
    assert_eq!(is_pandigital_9digits(987654321), true);
    assert_eq!(is_pandigital_9digits(314275869), true);
    assert_eq!(is_pandigital_9digits(765432189), true);
    assert_eq!(is_pandigital_9digits(1), false);
    assert_eq!(is_pandigital_9digits(123), false);
    assert_eq!(is_pandigital_9digits(987), false);
    assert_eq!(is_pandigital_9digits(121314151), false);
    assert_eq!(is_pandigital_9digits(123456780), false);
}

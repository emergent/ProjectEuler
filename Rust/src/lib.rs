pub fn is_prime_i64(x: i64) -> bool {
    let xmax = (x as f64).sqrt() as i64 + 1;
    match x {
        2 | 3 | 5 | 7 => true,
        _ if x < 2 || x % 2 == 0 => false,
        _ => {
            for i in (3..xmax).step_by(2) {
                if x % i == 0 { return false; }
            }
            true
        }
    }
}

pub fn is_prime_i32(x: i32) -> bool {
    let xmax = (x as f32).sqrt() as i32 + 1;
    match x {
        2 | 3 | 5 | 7 => true,
        _ if x < 2 || x % 2 == 0 => false,
        _ => {
            for i in (3..xmax).step_by(2) {
                if x % i == 0 { return false; }
            }
            true
        }
    }
}

pub fn primes(x: u32) -> Vec<u32> {
    match x {
        n if n <  2 => vec![],
        n if n == 2 => vec![2],
        n => {
            let mut ps = Vec::new();
            let mut target: Vec<u32> = (2..(n+1)).collect();
            let mut i = 2;
            while i * i <= n {
                ps.push(i);
                target = target.iter().filter(|&x| x % i != 0).cloned().collect::<Vec<u32>>();
                i = target[0];
            }
            ps.append(&mut target);
            ps
        }
    }
}

#[test]
fn test_primes() {
    assert_eq!(primes(1), []);
    assert_eq!(primes(2), [2]);
    assert_eq!(primes(3), [2, 3]);
    assert_eq!(primes(4), [2, 3]);
    assert_eq!(primes(5), [2, 3, 5]);
    assert_eq!(primes(100), [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97])
}

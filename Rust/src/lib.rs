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

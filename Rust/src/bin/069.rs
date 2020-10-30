fn gcd(x: u32, y: u32) -> u32 {
    if x == 0 {
        y
    } else {
        gcd(y % x, x)
    }
}

fn phi(n: u32) -> u32 {
    let mut count = 0;
    for i in 1..n {
        if gcd(i, n) == 1 {
            count += 1;
        }
    }
    count
}

fn main() {
    const N: u32 = 1_000_000;
    let primes = vec![2, 3, 5, 7, 11, 13, 17, 23, 29];

    let mut n = 1;
    let mut n_phi = 0.0;
    let mut ans = 1;

    for i in primes {
        n *= i;
        if n > N {
            break;
        }

        let p = phi(n);
        if p != 0 {
            let f = (n as f64) / (p as f64);
            if n_phi <= f {
                n_phi = f;
                ans = n;
            }
        }
    }
    println!("n={}, {}", ans, n_phi);
}

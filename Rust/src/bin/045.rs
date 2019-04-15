/// Problem 45 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=45
fn triangle(n: u32) -> u32 {
    n * (n + 1) / 2
}

fn is_penta(pn: u32) -> bool {
    let pnf: f64 = From::from(pn);
    let n = (1.0 + (24.0 * pnf + 1.0).sqrt()) / 6.0;
    n == n.trunc()
}

fn is_hexa(hn: u32) -> bool {
    let hnf: f64 = From::from(hn);
    let n = (1.0 + (8.0 * hnf + 1.0).sqrt()) / 4.0;
    n == n.trunc()
}

fn main() {
    for n in 286u32.. {
        let tn = triangle(n);
        if is_penta(tn) && is_hexa(tn) {
            println!("{}", tn);
            break;
        }
    }
}

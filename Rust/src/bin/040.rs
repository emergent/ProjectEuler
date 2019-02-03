/// Problem 40 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=40

fn main() {
    let mut numv = Vec::new();
    let mut idx = 1;
    let mut ans: i32 = 1;

    for i in 1.. {
        for c in i.to_string().chars() {
            numv.push(c as i8 - 48);
        }

        if numv.len() > idx {
            ans *= numv[idx-1] as i32;
            idx *= 10;
        }
        if idx > 1000000 { break; }
    }
    println!("{}", ans);
}

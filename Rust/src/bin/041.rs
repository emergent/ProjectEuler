/// Problem 41 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=41
extern crate project_euler;
use project_euler::is_prime;

fn perm(ins: Vec<i32>, outs: Vec<i32>, n: i32, res: &mut Vec<Vec<i32>>) {
    if ins.len() == 0 || n == 0 {
        res.push(outs);
    } else {
        for i in 0..ins.len() {
            let mut ins2 = ins.clone();
            let mut outs2 = outs.clone();
            let a = ins2[i];
            outs2.push(a);
            ins2.remove(i);
            perm(ins2, outs2, n-1, res);
        }
    }
}

fn permutations(n: i32) -> Vec<Vec<i32>> {
    if n < 1 {
        return vec![];
    }

    let mut res = Vec::<Vec<i32>>::new();
    let ins = (1..(n+1)).collect::<Vec<_>>();
    perm(ins, vec![], n, &mut res);
    res
}

fn numcat(v: &Vec<i32>) -> i32 {
    if v.is_empty() { return 0; }

    let mut catn: i32 = 0;
    for (i, &n) in v.iter().enumerate() {
        catn += 10_i32.pow((v.len()-i-1) as u32)  * n;
    }
    catn
}

fn pandigitals(d: i32) -> Vec<i32> {
    let res = permutations(d);
    res.into_iter().map(|r| numcat(&r)).collect::<Vec<i32>>()
}

fn main() {
    for i in (1..10).rev() {
        let mut ps = pandigitals(i);
        ps.reverse();
        for p in ps {
            if is_prime(p as u64) {
                println!("{}", p);
                return;
            }
        }
    }
}

#[test]
fn test_numcat() {
    assert_eq!(numcat(&vec![]), 0);
    assert_eq!(numcat(&vec![1]), 1);
    assert_eq!(numcat(&vec![1,2,3]), 123);
    assert_eq!(numcat(&vec![1,2,3,4]), 1234);
    assert_eq!(numcat(&vec![1,2,3,4]), 1234);
}

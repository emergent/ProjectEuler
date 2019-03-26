pub fn permutations<T>(ins: &Vec<T>, n: u32) -> Vec<Vec<T>>
    where T: Clone {
    let mut res = Vec::<Vec<T>>::new();
    perm(ins, vec![], n, &mut res);
    res
}

fn perm<T>(ins: &Vec<T>, outs: Vec<T>, n: u32, res: &mut Vec<Vec<T>>)
    where T: Clone {
    if ins.len() == 0 || n == 0 {
        res.push(outs);
    } else {
        for i in 0 .. ins.len() {
            let mut ins2 = ins.clone();
            let mut outs2 = outs.clone();
            let mut a = ins2[i].clone();
            outs2.push(a);
            ins2.remove(i);
            perm(&ins2, outs2, n-1, res);
        }
    }
}

#[test]
fn test_permtations() {
    assert_eq!(permutations(&vec![1,2,3],3), [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]);
    assert_eq!(permutations(&vec![1,2,3],2), [[1,2],[1,3],[2,1],[2,3],[3,1],[3,2]]);
    assert_eq!(permutations(&vec![1,2,3],1), [[1],[2],[3]]);
}

/// #59 XOR Decryption - Project Euler
/// http://projecteuler.net/problem=59
use std::fs::File;
use std::io::Read;
use std::path::Path;

fn read_cipher() -> Vec<u32> {
    let path = Path::new("data/p059_cipher.txt");

    let mut file = File::open(path).unwrap();
    let mut s = String::new();
    file.read_to_string(&mut s).unwrap();

    s.split(',')
        .filter_map(|ss| ss.parse::<u32>().ok())
        .collect::<Vec<_>>()
}

fn main() {
    let v = read_cipher();

    let range = (97..=122).collect::<Vec<u32>>();
    //let p = permutations(&range, 3);

    //for x in permutations(&range, 3) {
    for &x in &range {
        for &y in &range {
            for &z in &range {
                let keys = vec![x, y, z];
                let decry_i = v
                    .iter()
                    .zip(keys.iter().cycle())
                    .map(|(x, y)| *x ^ *y)
                    .collect::<Vec<u32>>();

                if decry_i.iter().all(|x| 32 <= *x && *x <= 122) {
                    let s = decry_i
                        .iter()
                        .filter_map(|i| char::from_u32(*i))
                        .collect::<String>();
                    if s.contains("the") {
                        println!("{s}");
                        println!(
                            "key: {}",
                            keys.into_iter()
                                .filter_map(|i| char::from_u32(i))
                                .collect::<String>()
                        );
                        println!("{}", decry_i.into_iter().sum::<u32>());
                        break;
                    }
                }
            }
        }
    }
}

/// Problem 18 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=18

const TRIANGLE: &str = "\
75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
";

fn main() {
    let tri: Vec<Vec<u32>> = TRIANGLE
        .trim()
        .split('\n')
        .map(|line| {
            line.split_whitespace()
                .map(|s| s.parse::<u32>().unwrap_or(0))
                .collect::<Vec<_>>()
        })
        .collect();

    let mut dp = vec![vec![0; tri.len()]; tri.len()];
    dp[0][0] = tri[0][0];
    for i in 0..tri.len() - 1 {
        for j in 0..tri[i].len() {
            dp[i + 1][j] = std::cmp::max(dp[i][j] + tri[i + 1][j], dp[i + 1][j]);
            dp[i + 1][j + 1] = std::cmp::max(dp[i][j] + tri[i + 1][j + 1], dp[i + 1][j + 1]);
        }
    }
    let ans = dp[tri.len() - 1].iter().max().unwrap();
    println!("{ans}");
}

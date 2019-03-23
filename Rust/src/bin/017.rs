/// Problem 17 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=17

fn count_strings(string: &str) -> i32 {
    string.split_whitespace()
        .map(|s| s.len() as i32)
        .sum()
}

fn count_from_1_to_9() -> i32 {
    count_strings("one two three four five six seven eight nine")
}

fn count_from_10_to_19() -> i32 {
    count_strings("ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen")
}

fn count_from_20_to_99() -> i32 {
    "twenty thirty forty fifty sixty seventy eighty ninety"
        .split_whitespace()
        .map(|s| s.len() as i32 * 10 + count_from_1_to_9())
        .sum()
}

fn count_from_1_to_99() -> i32 {
    count_from_1_to_9() + count_from_10_to_19() + count_from_20_to_99()
}

fn count_from_100_to_999() -> i32 {
    count_from_1_to_9() * 100 +
        "hundred".len() as i32 * 900 +
        "and".len() as i32 * (900 - 9) +
        count_from_1_to_99() * 9
}

fn count_1000() -> i32 {
    "one thousand".split_whitespace().map(|s| s.len() as i32).sum()
}

fn main() {
    println!("{}", count_from_1_to_99() + count_from_100_to_999() + count_1000());
}

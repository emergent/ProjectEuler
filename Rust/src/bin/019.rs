/// Problem 19 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=19

fn count_sundays() -> i32 {
    let daysofmonths = vec![31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    let mut days1901to2000 = Vec::new();

    for year in 1901..=2000 {
        if year % 400 == 0 || (year % 100 != 0 && year % 4 == 0) {
            let mut dom_leap = daysofmonths.clone();
            dom_leap[1] = 29;
            days1901to2000.extend_from_slice(&dom_leap);
        } else {
            days1901to2000.extend_from_slice(&daysofmonths);
        }
    }

    let mut amountofdays = 0;
    let mut sundays = 0;
    for days in days1901to2000.iter() {
        if amountofdays % 7 == 5 {
            sundays += 1;
        }
        amountofdays += days;
    }
    sundays
}

fn main() {
    println!("{}", count_sundays());
}

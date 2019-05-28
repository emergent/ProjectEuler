/// Problem 33 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=33
#[derive(Debug)]
struct Fraction {
    numerator: i32,
    denominator: i32,
}

impl Fraction {
    fn cancel_same_numbers(&self) -> Self {
        let ns = self
            .numerator
            .to_string()
            .chars()
            .map(|c| c as i32 - 48)
            .collect::<Vec<i32>>();
        let ds = self
            .denominator
            .to_string()
            .chars()
            .map(|c| c as i32 - 48)
            .collect::<Vec<i32>>();
        let mut n_after = 0;
        let mut d_after = 0;
        for &n in ns.iter().by_ref() {
            d_after = ds
                .iter()
                .filter(|&d| *d != n)
                .map(|j| j.to_string())
                .collect::<String>()
                .parse::<i32>()
                .unwrap_or(0);

            if d_after != self.denominator {
                n_after = ns
                    .iter()
                    .filter(|&j| *j != n)
                    .map(|j| j.to_string())
                    .collect::<String>()
                    .parse::<i32>()
                    .unwrap_or(0);
                break;
            }
        }
        Fraction {
            numerator: n_after,
            denominator: d_after,
        }
    }

    fn lowest_common_terms(&self) -> Self {
        let g = Self::gcd(self.numerator, self.denominator);
        Fraction {
            numerator: self.numerator / g,
            denominator: self.denominator / g,
        }
    }

    fn gcd(x: i32, y: i32) -> i32 {
        if x == 0 {
            y
        } else {
            Self::gcd(y % x, x)
        }
    }
}

impl PartialEq for Fraction {
    fn eq(&self, other: &Self) -> bool {
        if self.denominator == 0 || other.denominator == 0 {
            return false;
        }
        self.numerator * other.denominator == self.denominator * other.numerator
    }
}

fn main() {
    let mut v = Vec::new();
    for a in 10..100 {
        for b in a + 1..100 {
            if b % 10 == 0 {
                continue;
            }
            let f = Fraction {
                numerator: a,
                denominator: b,
            };
            if &f.cancel_same_numbers() == &f.lowest_common_terms() {
                v.push(f);
            }
        }
    }

    println!("{:?}", v);

    let ans_st = Fraction {
        numerator: v.iter().by_ref().fold(1, |acc, x| acc * x.numerator),
        denominator: v.iter().by_ref().fold(1, |acc, x| acc * x.denominator),
    }
    .lowest_common_terms();

    println!("{}", ans_st.denominator);
}

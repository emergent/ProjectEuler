/*
 * Problem 2 - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=2
 */
const fibevensum = (fmax: number) => {
    let a: number = 1;
    let b: number = 2;
    let sum: number = 0;
    while (b < fmax) {
        if (b % 2 == 0) {
            sum += b;
        }
        [a, b] = [b, a + b];
    }
    return sum;
};

console.log(fibevensum(4_000_000));

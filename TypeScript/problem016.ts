/*
 * #16 Power digit sum - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=16
 */
let x = 1n;
for (let i = 0; i < 1000; i++) {
    x *= 2n;
}

const ans = [...x.toString()]
    .map((c) => parseInt(c))
    .reduce((acc, x) => (isNaN(x) ? acc : acc + x));
console.log(ans);

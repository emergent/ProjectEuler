/*
 * #20 Factorial digit sum - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=20
 */
let x = 1n;
for (let i = 100n; i > 0; i--) {
    x *= i;
}

const ans = [...x.toString()]
    .map((c) => parseInt(c))
    .reduce((acc, x) => (isNaN(x) ? acc : acc + x));
console.log(ans);

/*
 * Problem 1 - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=1
 */
let summul = (n:number, x:number) => {
    return (x * ((n / x)|0) * ((1 + n / x)|0)) / 2;
};
let N = 999;
console.log(summul(N, 3) + summul(N, 5) - summul(N, 15));

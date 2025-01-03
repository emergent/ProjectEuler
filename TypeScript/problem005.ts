/*
 * Problem 5 - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=5
 */
{
    const gcd = (x: number, y: number): number => {
        return x === 0 ? y : gcd(y % x, x);
    };

    const lcm = (x: number, y: number): number => {
        return (x * y) / gcd(x, y);
    };

    console.log(
        [...Array(21).keys()].slice(1).reduce(lcm, 1)
    );
}

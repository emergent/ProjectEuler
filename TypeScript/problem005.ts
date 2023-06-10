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

    const reducer = (a: number, x: number): number => lcm(a, x);
    console.log(
        Array.from(Array(20).keys())
            .map(x => ++x)
            .reduce(lcm)
    );
}

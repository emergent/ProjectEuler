/*
 * #12 Highly Divisible Triangular Number - Project Euler
 * http://projecteuler.net/problem=12
 */
{
    function countDivisors(n: number): number {
        let count = 0;

        for (let i = 1; i * i <= n; i++) {
            if (n % i == 0) {
                count += (n / i != i) ? 2 : 1;
            }
        }

        return count;
    }

    let num = 1;
    let i = 1;
    while (true) {
        const count = countDivisors(num);
        if (count > 500) {
            console.log(num, count);
            break;
        }
        i += 1;
        num += i;
    }
}

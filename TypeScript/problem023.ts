/*
 * #23 Non-Abundant Sums - Project Euler
 * http://projecteuler.net/problem=23
 */
{
    const MAX = 28123;

    function getDivisorsSum(x: number): number {
        let i = 1;
        let sum = 0;
        while (i * i <= x) {
            if (x % i == 0) {
                if (x / i == i) {
                    sum += i;
                } else {
                    sum += x / i + i;
                }
            }
            i++;
        }
        return sum - x;
    }

    function getAbundantNumbersUnder28123(): number[] {
        return [...Array(MAX + 1).keys()].slice(1).filter((x) => getDivisorsSum(x) > x);
    }

    function sumOfTwoAbundants(a: number[]): number {
        const hs: Set<number> = new Set();

        for (let i = 0; i < a.length; i++) {
            for (let j = i; j < a.length; j++) {
                const value = a[i] + a[j];
                if (value <= MAX) {
                    hs.add(value);
                }
            }
        }

        let sumTwo = 0;
        for (const item of hs) {
            sumTwo += item;
        }

        return sumTwo;
    }

    const a: number[] = getAbundantNumbersUnder28123();
    let sumAll: number = [...Array(MAX + 1).keys()].slice(1).reduce((acc, x) => acc + x, 0);
    let sumTwo: number = sumOfTwoAbundants(a);
    console.log(sumAll - sumTwo);
}

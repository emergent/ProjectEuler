/*
 * #16 Power Digit Sum - Project Euler
 * http://projecteuler.net/problem=16
 */
{
    function sumOfDigitsPower(base: number, exp: number): number {
        let digits = [1];

        for (let time = 0; time < exp; time++) {
            let carried = 0;

            const len = digits.length;
            for (let i = 0; i < len; i++) {
                const m = digits[i] * base + carried;
                carried = Math.floor(m / 10);
                digits[i] = m % 10;

                if (i == digits.length - 1 && carried > 0) {
                    digits.push(carried);
                }
            }
        }

        return digits.reduce((acc, x) => acc + x);
    }

    console.log(sumOfDigitsPower(2, 1000));
}

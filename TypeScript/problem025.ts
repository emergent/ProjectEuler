/*
 * #25 $1000$-digit Fibonacci Number - Project Euler
 * http://projecteuler.net/problem=25
 */
{
    let a = [1];
    let b = [1];

    let i = 2; // index of b
    while (b.length < 1000) {
        let c = [...b];
        for (let j = 0; j < c.length; j++) {
            if (j < a.length) {
                c[j] += a[j];
            }

            if (c[j] >= 10) {
                if (j < c.length - 1) {
                    c[j + 1] += Math.floor(c[j] / 10);
                } else {
                    c.push(Math.floor(c[j] / 10));
                }
                c[j] %= 10;
            }
        }

        [a, b] = [b, c];
        i++;
    }

    console.log(i, b.toReversed().join().replace(/,/g, ''));
}

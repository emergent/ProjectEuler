/*
 * #15 Lattice Paths - Project Euler
 * http://projecteuler.net/problem=15
 */
{
    const n = 40;
    const k = 20;
    let c = [];
    for (let i = 0; i < n + 1; i++) {
        const a = new Array(n + 1);
        for (let j = 0; j < n + 1; j++) {
            a[j] = 0;
        }
        c.push(a);
    }

    for (let i = 0; i < n + 1; i++) {
        for (let j = 0; j <= i; j++) {
            if (i == 0 || j == 0) {
                c[i][j] = 1;
            } else {
                c[i][j] = c[i - 1][j - 1] + c[i - 1][j];
            }
        }
    }

    console.log(c[n][k]);
}

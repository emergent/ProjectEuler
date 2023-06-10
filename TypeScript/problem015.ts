/*
 * #15 Lattice Paths - Project Euler
 * http://projecteuler.net/problem=15
 */
{
    const N = 40;
    const K = 20;
    let c: number[][] = [];

    for (let i = 0; i < N + 1; i++) {
        c.push(new Array(N + 1).fill(0));

        for (let j = 0; j <= i; j++) {
            if (i == 0 || j == 0) {
                c[i][j] = 1;
            } else {
                c[i][j] = c[i - 1][j - 1] + c[i - 1][j];
            }
        }
    }

    console.log(c[N][K]);
}

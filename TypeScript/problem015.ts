/*
 * #15 Lattice paths - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=15
 */
{
    const N = 40;
    const array: number[][] = new Array<Array<number>>(N + 1);

    for (let i = 0; i <= N; i++) {
        array[i] = new Array(N + 1).fill(0);
        for (let j = 0; j < i + 1; j++) {
            switch (j) {
                case 0:
                case i:
                    array[i][j] = 1;
                    break;
                default:
                    array[i][j] = array[i - 1][j - 1] + array[i - 1][j];
                    break;
            }
        }
    }

    console.log(array[40][20]);
}

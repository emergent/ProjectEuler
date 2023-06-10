/*
 * Problem 4 - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=4
 */
{
    const isPalindromic = (x: number): boolean => {
        return (
            x ===
            parseInt(
                x
                    .toString()
                    .split("")
                    .reverse()
                    .join("")
            )
        );
    };

    let nmax = 0;
    for (let a = 100; a < 1000; a++) {
        for (let b = 100; b < 1000; b++) {
            let n = a * b;
            if (isPalindromic(n)) {
                nmax = nmax > n ? nmax : n;
            }
        }
    }
    console.log(nmax);
}

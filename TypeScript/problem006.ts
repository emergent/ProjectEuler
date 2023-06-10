/*
 * Problem 6 - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=6
 */
{
    let sqsum = 0;
    let sumsq = 0;
    for (let i = 1; i <= 100; i++) {
        sqsum += i * i;
        sumsq += i;
    }
    console.log(sumsq * sumsq - sqsum);
}

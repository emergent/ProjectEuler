/*
 * Problem 3 - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=3
 */
const maxprimefactor = (x: number): number => {
    let divider = 2;
    while (x != 1) {
        if (x % divider == 0) {
            x /= divider;
        } else {
            divider += 1;
        }
    }
    return divider;
}

{
    const N: number = 600851475143;
    console.log(`largest prime factor of ${N} is ${maxprimefactor(N)}.`);
}

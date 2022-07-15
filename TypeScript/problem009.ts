/*
 * #9 Special Pythagorean triplet - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=9
 */

outer: for (let a = 1; a < 999; a++) {
    for (let b = a + 1; b < 1000 - a; b++) {
        const c = 1000 - a - b;
        if (a * a + b * b === c * c) {
            console.log(a * b * c);
            break outer;
        }
    }
}

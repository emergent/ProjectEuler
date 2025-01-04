/*
 * #24 Lexicographic Permutations - Project Euler
 * http://projecteuler.net/problem=24
 */
{
    const nextPermutation = (items: number[]): boolean => {
        const n = items.length - 1;
        if (n < 1) {
            return false;
        }

        let j = n - 1;
        while (items[j] >= items[j + 1]) {
            if (j == 0) {
                return false;
            }
            j--;
        }

        let l = n;
        while (items[j] >= items[l]) {
            l -= 1;
        }
        [items[j], items[l]] = [items[l], items[j]] // swap values

        let k = j + 1;
        l = n;
        while (k < l) {
            [items[k], items[l]] = [items[l], items[k]] // swap values
            k += 1;
            l -= 1;
        }

        return true;
    }

    let v = [...Array(10).keys()];
    let i = 2;
    while (i <= 1000000) {
        nextPermutation(v);
        i++;
    }

    let ans = 0;
    for (const x of v) {
        ans = ans * 10 + x;
    }
    console.log(ans);
}

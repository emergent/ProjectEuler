/*
 * #21 Amicable numbers - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=21
 */
const divisors = (x: number): number[] => {
    const set = new Set<number>();
    for (let i = 1; i * i <= x; i++) {
        if (x % i == 0) {
            set.add(i);
            set.add(x / i);
        }
    }
    return [...set];
}

const d = (x: number): number => {
    return divisors(x).reduce((acc, x) => acc + x, 0) - x;
}

const amicable_pair = (x: number): [number, number] | null => {
    if (x == 1) {
        return null;
    }

    const dx = d(x);
    if (x < 10000 && x != dx && x == d(dx)) {
        return [x, dx];
    } else {
        return null;
    }
}

const main = () => {
    const set = new Set<number>();
    for (let i = 1; i <= 10000; i++) {
        const pair = amicable_pair(i);
        if (pair !== null) {
            set.add(pair[0]);
            set.add(pair[1]);
        }
    }
    console.log([...set].reduce((acc, x) => acc + x, 0));
}

main();

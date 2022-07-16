export function sieve(max: number): number[] {
    const mark = new Array<boolean>(max + 1).fill(false, 0, 2).fill(true, 2);
    for (let i = 2; i * i <= max; i++) {
        if (!mark[i]) {
            continue;
        }
        let x = i * 2;
        while (x <= max) {
            mark[x] = false;
            x += i;
        }
    }

    return mark.map((x, i) => (x ? i : 0)).filter((y) => y > 0);
}

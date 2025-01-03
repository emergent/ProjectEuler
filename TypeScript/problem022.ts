/*
 * #22 Names Scores - Project Euler
 * http://projecteuler.net/problem=22
 */
async function readFileUniversal(filePath: string): Promise<string> {
    // -- 1) Deno環境かどうか判定し、読み込み
    if (typeof Deno !== "undefined" && typeof Deno.readTextFile !== "undefined") {
        // Deno向けAPI
        return await Deno.readTextFile(filePath);
    }

    // -- 2) Bun環境かどうか判定し、読み込み
    if (typeof Bun !== "undefined" && typeof Bun.file !== "undefined") {
        // Bun向けAPI
        return await Bun.file(filePath).text();
    }

    // -- 3) Node.js環境の場合、fsモジュールを動的importして読み込み
    const fs = await import("node:fs/promises");
    return await fs.readFile(filePath, "utf-8");
}

{
    const path = './0022_names.txt';
    try {
        const text = await readFileUniversal(path);


        const names = text.split(',').map((x) => x.replace(/"/g, ''));
        names.sort();

        let ans = 0;
        let i = 0;
        for (const name of names) {
            const nameSum = [...name].map((x: string) =>
                (x.codePointAt(0) ?? 0) - 65 + 1)
                .reduce((acc, x) => acc + x, 0);
            ans += nameSum * ++i;
        }

        console.log(ans);
    } catch (error) {
        console.error(error);
    }
}

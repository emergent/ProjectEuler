// zig version 0.10.1
const std = @import("std");
const stdout = std.io.getStdOut().writer();

// #31 Coin sums - Project Euler
// http://projecteuler.net/problem=31
pub fn main() !void {
    const m = [_]u32{200, 100, 50, 20, 10, 5, 2, 1};
    const count = dfs(&m, 200, 0);

    try stdout.print("{}\n", .{count});
}

fn dfs(m: *const [8]u32, rest: u32, idx: u32 ) u32 {
    if (idx == m.len - 1 or rest == 0) {
        return 1;
    }

    var count: u32 = 0;
    var i: u32 = 0;
    while (rest >= i * m[idx]): (i += 1) {
        count += dfs(m, rest - i * m[idx], idx+1);
    }
    return count;
}

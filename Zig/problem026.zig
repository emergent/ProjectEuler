// zig version 0.11.0-dev
const std = @import("std");
const stdout = std.io.getStdOut().writer();
const util = @import("util.zig");

// #26 Reciprocal cycles - Project Euler
// http://projecteuler.net/problem=26
pub fn main() !void {
    var ans: u64 = 0;
    var maxcount: u64 = 0;

    const ps = try util.primes(1000);
    defer ps.deinit();

    for (ps.items) |p| {
        const count = count_cycle(p);
        if (maxcount < count) {
            maxcount = count;
            ans = p;
        }
    }

    try stdout.print("{}\n", .{ans});
}

fn count_cycle(x: u64) u64 {
    var count: u64 = 0;
    var n: u64 = 1;

    while (n % x == n) : (n *= 10) {
        count += 1;
    }

    while (n % x != 1) {
        if (n % x == 0) {
            return 0;
        }
        count += 1;
        n = (n % x) * 10;
    }

    return count;
}

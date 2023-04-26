// zig version 0.10.0
const std = @import("std");
const stdout = std.io.getStdOut().writer();
const util = @import("util.zig");

// #7 10001st prime - Project Euler
// http://projecteuler.net/index.php?section=problems&id=7
pub fn main() !void {
    @setEvalBranchQuota(1000000);
    const max = 110000;
    const index = 10000;
    const p = comptime blk: {
        const marks = util.markPrimes(max);
        const size = util.countPrimes(&marks);
        var primes: [size]u64 = undefined;
        util.primesComp(&marks, size, &primes);
        //@compileLog("{}\n", .{primes[10001]});
        break :blk primes[index];
    };

    try stdout.print("{}\n", .{p});
}

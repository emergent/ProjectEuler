// zig version 0.10.1
const std = @import("std");
const stdout = std.io.getStdOut().writer();
const primes = @import("util.zig").primes;

// #10 Summation of primes - Project Euler
// http://projecteuler.net/index.php?section=problems&id=10
pub fn main() !void {
    const ps = try primes(2000000);

    var ans: u64 = 0;
    for (ps.items) |p| {
        ans += p;
    }

    try stdout.print("{}\n", .{ans});
}

// zig version 0.10.0
const std = @import("std");
const stdout = std.io.getStdOut().writer();
const primes = @import("util.zig").primes;

// #7 10001st prime - Project Euler
// http://projecteuler.net/index.php?section=problems&id=7
pub fn main() !void {
    const ps = try primes(200000);
    defer ps.deinit();

    try stdout.print("{}\n", .{ps.items[10000]});
}

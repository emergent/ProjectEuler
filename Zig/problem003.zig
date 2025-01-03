// zig version 0.13.0
const std = @import("std");
const stdout = std.io.getStdOut().writer();

// #3 Largest prime factor - Project Euler
// http://projecteuler.net/index.php?section=problems&id=3
pub fn main() !void {
    var target: u64 = 600851475143;
    var ans: u64 = 0;
    var i: u64 = 2;

    while (i * i <= target) : (i += 1) {
        while (target % i == 0) {
            ans = i;
            target /= i;
        }
    }

    if (target > ans) {
        ans = target;
    }

    try stdout.print("{}\n", .{ans});
}

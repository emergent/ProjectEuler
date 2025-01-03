// zig version 0.13.0
const std = @import("std");
const stdout = std.io.getStdOut().writer();

// #9 Special Pythagorean triplet - Project Euler
// http://projecteuler.net/index.php?section=problems&id=9
pub fn main() !void {
    const N = 1000;

    L: for (1..N) |i| {
        for (i..N - i) |j| {
            const k = N - i - j;
            if (i * i + j * j == k * k) {
                try stdout.print("{}\n", .{i * j * k});
                break :L;
            }
        }
    }
}

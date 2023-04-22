// zig version 0.11.0-dev
const std = @import("std");
const stdout = std.io.getStdOut().writer();

// #9 Special Pythagorean triplet - Project Euler
// http://projecteuler.net/index.php?section=problems&id=9
pub fn main() !void {
    const N = 1000;

    var i: u64 = 1;
    L: while (i < N) : (i += 1) {
        var j: u64 = i;
        while (i + j < N) : (j += 1) {
            const k = N - i - j;
            if (i * i + j * j == k * k) {
                try stdout.print("{}\n", .{i * j * k});
                break :L;
            }
        }
    }
}

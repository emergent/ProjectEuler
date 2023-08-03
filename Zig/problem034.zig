// zig version 0.11.1-dev
const std = @import("std");
const stdout = std.io.getStdOut().writer();

// #34 Digit Factorials - Project Euler
// http://projecteuler.net/problem=34
pub fn main() !void {
    var fs = [_]u64{1} ** 10;
    for (1..10) |i| {
        fs[i] *= fs[i - 1] * i;
    }

    var ans: u64 = 0;
    for (3..1000000) |i| {
        var sum: u64 = 0;
        var j = i;

        while (j > 0) : (j /= 10) {
            sum += fs[j % 10];
        }

        if (sum == i) {
            ans += i;
        }
    }

    try stdout.print("{}\n", .{ans});
}

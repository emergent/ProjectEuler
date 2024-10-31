// zig version 0.11.0-dev
const std = @import("std");
const stdout = std.io.getStdOut().writer();

// #30 Digit fifth powers - Project Euler
// http://projecteuler.net/problem=30
pub fn main() !void {
    var ans: u64 = 0;

    for (2..354294 + 1) |i| {
        const sum: u64 = blk: {
            var s: u64 = 0;
            var x: u64 = i;
            while (x > 0) : (x /= 10) {
                s += pow5(x % 10);
            }
            break :blk s;
        };

        if (i == sum) {
            ans += i;
        }
    }

    try stdout.print("{}\n", .{ans});
}

fn pow5(x: u64) u64 {
    return x * x * x * x * x;
}

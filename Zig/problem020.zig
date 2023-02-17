// zig version 0.10.1
const std = @import("std");
const stdout = std.io.getStdOut().writer();

// #20 Factorial digit sum - Project Euler
// http://projecteuler.net/index.php?section=problems&id=20
pub fn main() !void {
    const ans = sumOfDigitsFactorial(100);
    try stdout.print("{}\n", .{ans});
}

fn sumOfDigitsFactorial(comptime n: u32) u32 {
    var digits = [_]u32{0} ** (n * 3);
    digits[0] = 1;

    var i: u32 = 1;
    var len: usize = 1;
    while (i <= n) : (i += 1) {
        var carried: u32 = 0;

        for (digits) |*value, j| {
            if (j >= len and carried == 0) {
                break;
            }

            if (j >= len) {
                len += 1;
                value.* = carried % 10;
                carried /= 10;
            } else {
                const d = value.* * i + carried;
                value.* = d % 10;
                carried = d / 10;
            }
        }
    }

    return sum(&digits);
}

fn sum(arr: []const u32) u32 {
    var s: u32 = 0;
    for (arr) |value| {
        s += value;
    }
    return s;
}

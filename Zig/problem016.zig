// zig version 0.10.1
const std = @import("std");
const stdout = std.io.getStdOut().writer();

// #16 Power digit sum - Project Euler
// http://projecteuler.net/index.php?section=problems&id=16
pub fn main() !void {
    const N = 1000;
    const BASE = 2;
    var digits = [_]u32{0} ** N; // array of 1000 items
    digits[0] = 1;

    var i: u32 = 0;
    var len: usize = 1;
    while (i < N) : (i += 1) {
        var carried: u32 = 0;

        for (digits) |*value, j| {
            if (j == len) {
                if (carried > 0) {
                    value.* = carried;
                    len += 1;
                }
                break;
            }

            const d = value.* * BASE + carried;
            value.* = d % 10;
            carried = d / 10;
        }
    }

    const ans = sum(&digits);
    try stdout.print("{}\n", .{ans});
}

fn sum(arr: []const u32) u32 {
    var s: u32 = 0;
    for (arr) |value| {
        s += value;
    }
    return s;
}

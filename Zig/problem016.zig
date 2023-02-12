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

        var j: usize = 0;
        const loop_max = len;
        while (j < loop_max) : (j += 1) {
            const d = digits[j] * BASE + carried;

            if (d >= 10) {
                digits[j] = d % 10;
                carried = d / 10;

                if (j == len - 1 and carried > 0) {
                    digits[len] = carried;
                    len += 1;
                }
            } else {
                digits[j] = d;
                carried = 0;
            }
        }
    }

    var sum: u32 = 0;
    for (digits) |value| {
        sum += value;
    }

    try stdout.print("{}\n", .{sum});
}

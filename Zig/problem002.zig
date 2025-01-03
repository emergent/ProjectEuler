// zig version 0.13.0
const std = @import("std");
const stdout = std.io.getStdOut().writer();

pub fn main() !void {
    var sum: u64 = 0;
    var a: u64 = 1;
    var b: u64 = 2;
    while (a <= 4000000) {
        b = a + b;
        a = b - a;
        if (a % 2 == 0) {
            sum += a;
        }
    }
    try stdout.print("{}\n", .{sum});
}

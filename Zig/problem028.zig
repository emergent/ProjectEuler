// zig version 0.13.0
const std = @import("std");
const stdout = std.io.getStdOut().writer();

// #28 Number spiral diagonals - Project Euler
// http://projecteuler.net/problem=28
pub fn main() !void {
    const ans = comptime sumDiagonalsSpiral(1001);

    try stdout.print("{}\n", .{ans});
}

fn sumDiagonalsSpiral(n: i64) i64 {
    var i: i64 = 1;
    var sum: i64 = 0;
    while (i <= n) : (i += 2) {
        sum += i * i * 4 - i * 6 + 6;
    }
    return sum - 3;
}

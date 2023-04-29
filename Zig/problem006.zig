// zig version 0.11.0-dev
const std = @import("std");
const stdout = std.io.getStdOut().writer();

// #6 Sum square difference - Project Euler
// http://projecteuler.net/index.php?section=problems&id=6
pub fn main() !void {
    const N = 100;
    var square_sum: u64 = 0;

    for (1..N + 1) |i| {
        square_sum += i * i;
    }

    const sum = (1 + N) * N / 2;
    const sum_square = sum * sum;

    try stdout.print("{}\n", .{sum_square - square_sum});
}

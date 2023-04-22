// zig version 0.11.0-dev
const std = @import("std");
const stdout = std.io.getStdOut().writer();

// #12 Highly divisible triangular number - Project Euler
// http://projecteuler.net/index.php?section=problems&id=12
fn countDivisors(x: u32) usize {
    var count: usize = 0;
    var i: u32 = 1;

    while (i * i <= x) : (i += 1) {
        if (x % i == 0) {
            count += 1;
            if (!(x / i == i or i == x)) {
                count += 1;
            }
        }
    }

    return count;
}

pub fn main() !void {
    var triangle: u32 = 1;
    var adder: u32 = 2;

    while (countDivisors(triangle) <= 500) : (adder += 1) {
        triangle += adder;
    }

    try stdout.print("{}\n", .{triangle});
}

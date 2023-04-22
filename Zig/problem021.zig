// zig version 0.11.0-dev
const std = @import("std");
const stdout = std.io.getStdOut().writer();

// #21 Amicable numbers - Project Euler
// http://projecteuler.net/index.php?section=problems&id=21
fn d(x: u64) u64 {
    var sum: u64 = 0;
    var i: u64 = 1;
    while (i * i <= x) : (i += 1) {
        if (x % i == 0) {
            sum += i;
            const m = x / i;
            if (m != i and m != x) {
                sum += m;
            }
        }
    }

    return sum;
}

pub fn main() !void {
    var ans: u64 = 0;
    var i: u64 = 2;
    while (i < 10000) : (i += 1) {
        const di = d(i);
        if (d(di) == i and i < di and di < 10000) {
            ans += i + di;
        }
    }

    try stdout.print("{}\n", .{ans});
}

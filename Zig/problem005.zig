// zig version 0.13.0
const std = @import("std");
const stdout = std.io.getStdOut().writer();

// #5 Smallest multiple - Project Euler
// http://projecteuler.net/index.php?section=problems&id=5
pub fn main() !void {
    var ans: i64 = 1;
    inline for (1..20 + 1) |i| {
        ans = lcm(ans, i);
    }

    try stdout.print("{}\n", .{ans});
}

fn gcd(x: i64, y: i64) i64 {
    if (y == 0) {
        return x;
    }
    return gcd(y, @mod(x, y));
}

fn lcm(x: i64, y: i64) i64 {
    return @divTrunc(x * y, gcd(x, y));
}

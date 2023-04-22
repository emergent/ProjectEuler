// zig version 0.10.1
const std = @import("std");
const stdout = std.io.getStdOut().writer();

// #27 Quadratic primes - Project Euler
// http://projecteuler.net/problem=27
pub fn main() !void {
    var max_count: usize = 0;
    var ans: i64 = 0;

    var i: i64 = -999;
    while (i < 1000) : (i += 1) {
        var j: i64 = -999;
        while (j < 1000) : (j += 1) {
            const count = count_primes(i, j);
            if (max_count < count) {
                max_count = count;
                ans = i * j;
            }
        }
    }

    try stdout.print("{}\n", .{ans});
}

fn count_primes(a: i64, b: i64) usize {
    var n: usize = 0;
    return while (is_prime(f(a, b, @intCast(i64, n)))) : (n += 1) {} else n;
}

fn f(a: i64, b: i64, n: i64) i64 {
    return n * n + a * n + b;
}

fn is_prime(x: i64) bool {
    if (x == 2) {
        return true;
    } else if (x < 2 or @mod(x, 2) == 0) {
        return false;
    }

    var n: i64 = 3;
    return while (n * n <= x) : (n += 2) {
        if (@mod(x, n) == 0) {
            break false;
        }
    } else true;
}

const expect = std.testing.expect;

test "is_prime" {
    // true
    try expect(is_prime(2));
    try expect(is_prime(3));
    try expect(is_prime(5));
    try expect(is_prime(7));
    try expect(is_prime(11));
    try expect(is_prime(13));
    try expect(is_prime(17));

    // false
    try expect(!is_prime(-1));
    try expect(!is_prime(0));
    try expect(!is_prime(1));
    try expect(!is_prime(4));
    try expect(!is_prime(6));
    try expect(!is_prime(8));
    try expect(!is_prime(9));
}

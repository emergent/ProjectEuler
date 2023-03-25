// zig version 0.10.1
const std = @import("std");
const stdout = std.io.getStdOut().writer();
const util = @import("util.zig");
const allocator = std.heap.page_allocator;

// #35 Circular primes - Project Euler
// http://projecteuler.net/problem=35
pub fn main() !void {
    const ps = try util.primes(1_000_000);
    defer ps.deinit();

    var set = std.AutoHashMap(u64, void).init(allocator);
    defer set.deinit();

    for (ps.items) |p| {
        try set.put(p, {});
    }

    var count: usize = 0;
    for (ps.items) |p| {
        if (isCircularPrime(set, p)) {
            count += 1;
        }
    }

    try stdout.print("{}\n", .{count});
}

fn isCircularPrime(set: std.AutoHashMap(u64, void), p: u64) bool {
    var pi = rot(p);
    while (pi != p) : (pi = rot(pi)) {
        if (!set.contains(pi)) {
            return false;
        }
    }

    return true;
}

fn rot(n: u64) u64 {
    if (n == 0) return 0;

    var digits = [_]u64{0} ** 8;
    var i: usize = 0;
    var x: u64 = n;
    while (x > 0) : (i += 1) {
        digits[i] = x % 10;
        x /= 10;
    }

    const len = i;
    var ret: u64 = 0;
    var d: u64 = 1;

    i = 1;
    while (i < len) : (i += 1) {
        ret += digits[i] * d;
        d *= 10;
    }
    ret += digits[0] * d;

    return ret;
}

const expectEqual = std.testing.expectEqual;
test "rot" {
    try expectEqual(rot(0), 0);
    try expectEqual(rot(1), 1);
    try expectEqual(rot(2), 2);
    try expectEqual(rot(12), 21);
    try expectEqual(rot(13), 31);
    try expectEqual(rot(31), 13);
    try expectEqual(rot(123), 312);
    try expectEqual(rot(12345), 51234);
}

const e = std.testing.expect;
test "isCircularPrime" {
    var set = std.AutoHashMap(u64, void).init(std.testing.allocator);
    defer set.deinit();
    var ps = try util.primes(100);
    defer ps.deinit();

    for (ps.items) |p| {
        try set.put(p, {});
    }

    try e(isCircularPrime(set, 2));
    try e(isCircularPrime(set, 3));
    try e(isCircularPrime(set, 5));
    try e(isCircularPrime(set, 7));
    try e(isCircularPrime(set, 11));
    try e(isCircularPrime(set, 13));
    try e(isCircularPrime(set, 17));
    try e(isCircularPrime(set, 31));
    try e(isCircularPrime(set, 37));
    try e(isCircularPrime(set, 71));
    try e(isCircularPrime(set, 73));
    try e(isCircularPrime(set, 79));
    try e(isCircularPrime(set, 97));

    try e(!isCircularPrime(set, 19));
    try e(!isCircularPrime(set, 23));
    try e(!isCircularPrime(set, 29));
    try e(!isCircularPrime(set, 41));
}

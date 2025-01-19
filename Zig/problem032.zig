// zig version 0.13.0
const std = @import("std");
const stdout = std.io.getStdOut().writer();
const allocator = std.heap.page_allocator;

// #32 Pandigital Products - Project Euler
// http://projecteuler.net/problem=32
fn isPandigital(a: u64, b: u64, c: u64) bool {
    var f = [_]bool{false} ** 10;

    var t = [_]u64{ a, b, c };

    for (&t) |*x| {
        while (x.* > 0) {
            const digit = @as(usize, x.* % 10);
            if (digit == 0 or f[digit]) {
                return false;
            }

            f[digit] = true;
            x.* /= 10;
        }
    }

    for (f[1..]) |fa| {
        if (!fa) return false;
    }
    return true;
}

pub fn main() !void {
    var set = std.AutoHashMap(u64, void).init(allocator);
    defer set.deinit();

    for (1..100) |i| {
        const values = if (i < 10) .{ @as(u64, 1000), @as(u64, 10000) } else .{ @as(u64, 100), @as(u64, 1000) };
        var j = values[0];
        while (j < values[1]) {
            if (isPandigital(i, j, i * j)) {
                try set.put(i * j, {});
            }
            j += 1;
        }
    }

    var it = set.keyIterator();
    var ans: u64 = 0;
    while (it.next()) |v| {
        ans += v.*;
    }
    try stdout.print("{}\n", .{ans});
}

// zig version 0.13.0
const std = @import("std");
const stdout = std.io.getStdOut().writer();
const allocator = std.heap.page_allocator;

const MAX: u64 = 28123;

// #23 Non-abundant sums - Project Euler
// http://projecteuler.net/index.php?section=problems&id=23
pub fn main() !void {
    var abundants = std.ArrayList(u64).init(allocator);
    //try abundants.ensureTotalCapacity(30000);
    defer abundants.deinit();

    var set = std.AutoHashMap(u64, void).init(allocator);
    defer set.deinit();

    var i: u64 = 12;
    while (i <= MAX) : (i += 1) {
        if (isAbundant(i)) {
            try abundants.append(i);
        }
    }

    for (abundants.items) |x| {
        for (abundants.items) |y| {
            if (x <= y and x + y < MAX) {
                try set.put(x + y, {});
            }
        }
    }

    var ans: u64 = 0;
    i = 0;
    while (i < MAX) : (i += 1) {
        if (!set.contains(i)) {
            ans += i;
        }
    }

    try stdout.print("{}\n", .{ans});
}

fn isAbundant(x: u64) bool {
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

    return sum > x;
}

const testing = std.testing;

test "x is or is not abundant" {
    try testing.expect(isAbundant(12));

    var i: u64 = 1;
    while (i < 12) : (i += 1) {
        try testing.expect(!isAbundant(i));
    }
}

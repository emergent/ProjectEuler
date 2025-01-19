// zig version 0.13.0
const std = @import("std");
const stdout = std.io.getStdOut().writer();
const ArrayList = std.ArrayList;
const allocator = std.heap.page_allocator;

// #36 Double-base Palindromes - Project Euler
// http://projecteuler.net/problem=36
fn isPalindromic(n: u64, base: u64) !bool {
    var digits = ArrayList(u64).init(allocator);
    defer digits.deinit();

    var x = n;
    while (x > 0) : (x = @divTrunc(x, base)) {
        try digits.append(@mod(x, base));
    }

    for (0..@divTrunc(digits.items.len, 2)) |i| {
        if (digits.items[i] != digits.items[digits.items.len - 1 - i]) {
            return false;
        }
    }

    return true;
}

fn isPalindromicInBase10And2(i: u64) !bool {
    return try isPalindromic(i, 10) and try isPalindromic(i, 2);
}

pub fn main() !void {
    var ans: u64 = 0;

    const MAX: u64 = 1000000;
    for (1..MAX) |i| {
        if (try isPalindromicInBase10And2(i)) {
            ans += i;
        }
    }

    try stdout.print("{}\n", .{ans});
}

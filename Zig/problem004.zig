// zig version 0.10.0
const std = @import("std");
const stdout = std.io.getStdOut().writer();
const ArrayList = std.ArrayList;
const allocator = std.heap.page_allocator;

// #4 Largest palindrome product - Project Euler
// http://projecteuler.net/index.php?section=problems&id=4
pub fn main() !void {
    var ans: u32 = 0;

    for (100..1000) |i| {
        for (i..1000) |j| {
            const x = @intCast(u32, i * j);
            if (ans < x and try is_palindromic(x)) {
                ans = x;
            }
        }
    }

    try stdout.print("{}\n", .{ans});
}

fn is_palindromic(n: u32) !bool {
    var digits = ArrayList(u32).init(allocator);
    defer digits.deinit();

    var i: usize = 0;
    var x: u32 = n;
    while (x > 0) : (x = @divTrunc(x, 10)) {
        try digits.append(@mod(x, 10));
        i += 1;
    }

    var ret = false;
    const len = digits.items.len;
    for (0..@divTrunc(len, 2)) |j| {
        if (digits.items[j] != digits.items[len - j - 1]) {
            break;
        }
    } else {
        ret = true;
    }

    return ret;
}

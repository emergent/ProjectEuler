// zig version 0.10.0
const std = @import("std");
const stdout = std.io.getStdOut().writer();
const ArrayList = std.ArrayList;
const allocator = std.heap.page_allocator;

// #4 Largest palindrome product - Project Euler
// http://projecteuler.net/index.php?section=problems&id=4
pub fn main() !void {
    var ans: i32 = 0;
    var i: i32 = 100;

    while (i < 1000) : (i += 1) {
        var j = i;
        while (j < 1000) : (j += 1) {
            const x = i * j;
            if (ans < x and try is_palindromic(x)) {
                ans = x;
            }
        }
    }

    try stdout.print("{}\n", .{ans});
}

fn is_palindromic(n: i32) !bool {
    var digits = ArrayList(i32).init(allocator);
    defer digits.deinit();

    var i: usize = 0;
    var x: i32 = n;
    while (x > 0) : (x = @divTrunc(x, 10)) {
        try digits.append(@mod(x, 10));
        i += 1;
    }

    var ret = false;
    var j: usize = 0;
    const len = digits.items.len;
    while (j < @divTrunc(len, 2)) : (j += 1) {
        if (digits.items[j] != digits.items[len - j - 1]) {
            break;
        }
    } else {
        ret = true;
    }

    return ret;
}

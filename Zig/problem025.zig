// zig version 0.10.1
const std = @import("std");
const stdout = std.io.getStdOut().writer();
const allocator = std.heap.page_allocator;
const big = @import("big.zig");

// #25 1000-digit Fibonacci number - Project Euler
// http://projecteuler.net/problem=25
pub fn main() !void {
    var a = try big.BigInt(u64).init(allocator, 1);
    defer a.deinit();
    var b = try big.BigInt(u64).init(allocator, 1);
    defer b.deinit();
    var tmp = try big.BigInt(u64).init(allocator, 1);
    defer tmp.deinit();

    var i: usize = 1;
    while (true) : (i += 1) {
        if (a.len() >= 1000) {
            break;
        }
        try tmp.reset(a);
        try a.reset(b);
        _ = try tmp.add(b);
        try b.reset(tmp);

        //try a.printDigits();
    }

    try stdout.print("{}\n", .{i});
}

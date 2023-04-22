// zig version 0.10.1
const std = @import("std");
const stdout = std.io.getStdOut().writer();
const big = @import("big.zig");

// #29 Distinct powers - Project Euler
// http://projecteuler.net/problem=29
pub fn main() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    var set = std.StringHashMap(void).init(allocator);
    defer set.deinit();

    var a: u64 = 2;
    while (a <= 100) : (a += 1) {
        var b: u32 = 2;
        while (b <= 100) : (b += 1) {
            var a2 = try big.BigInt.init(allocator, a);
            defer a2.deinit();

            try a2.exp(b);
            const s = try a2.toString(allocator);
            //std.debug.print("{}^{}={s}\n", .{ a, b, s });
            try set.put(s, {});
        }
    }

    const ans = set.count();
    try stdout.print("{}\n", .{ans});
}

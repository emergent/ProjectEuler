// zig version 0.13.0
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

    for (2..101) |a| {
        for (2..101) |b| {
            const i: u32 = @intCast(a);
            var a2 = try big.BigInt.init(allocator, i);
            defer a2.deinit();

            const j: u32 = @intCast(b);
            try a2.exp(j);
            const s = try a2.toString(allocator);
            //std.debug.print("{}^{}={s}\n", .{ a, b, s });
            try set.put(s, {});
        }
    }

    const ans = set.count();
    try stdout.print("{}\n", .{ans});
}

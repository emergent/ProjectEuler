// zig version 0.10.0
const std = @import("std");
const stdout = std.io.getStdOut().writer();
const ArrayList = std.ArrayList;
const allocator = std.heap.page_allocator;

// #7 10001st prime - Project Euler
// http://projecteuler.net/index.php?section=problems&id=7
pub fn main() !void {
    const ps = try primes(200000);
    defer ps.deinit();

    try stdout.print("{}\n", .{ps.items[10000]});
}

fn primes(comptime max: u64) !ArrayList(u64) {
    var marks: [max + 1]bool = undefined;
    for (marks) |_, i| {
        marks[i] = i >= 2;
    }

    var ps = ArrayList(u64).init(allocator);

    for (marks) |_, i| {
        if (!marks[i]) {
            continue;
        }

        try ps.append(i);
        var j = i * 2;
        while (j <= max) : (j += i) {
            marks[j] = false;
        }
    }

    return ps;
}

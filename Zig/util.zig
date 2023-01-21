const std = @import("std");
const ArrayList = std.ArrayList;
const allocator = std.heap.page_allocator;

pub fn primes(comptime max: u64) !ArrayList(u64) {
    var marks: [max + 1]bool = undefined;
    for (marks) |_, i| {
        marks[i] = i >= 2;
    }

    var i: u64 = 2;
    while (i * i <= max) : (i += 1) {
        if (!marks[i]) {
            continue;
        }

        var j = i * 2;
        while (j <= max) : (j += i) {
            marks[j] = false;
        }
    }

    var ps = ArrayList(u64).init(allocator);
    for (marks) |mark, j| {
        if (mark) {
            try ps.append(j);
        }
    }

    return ps;
}

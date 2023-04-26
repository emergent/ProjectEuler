const std = @import("std");
const ArrayList = std.ArrayList;
const allocator = std.heap.page_allocator;

pub fn primes(comptime max: u64) !ArrayList(u64) {
    var marks: [max + 1]bool = undefined;
    for (marks, 0..) |_, i| {
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
    for (marks, 0..) |mark, j| {
        if (mark) {
            try ps.append(j);
        }
    }

    return ps;
}

pub fn markPrimes(comptime max: u64) [max + 1]bool {
    comptime var marks = blk: {
        var m: [max + 1]bool = undefined;
        inline for (m, 0..) |_, i| {
            m[i] = i >= 2;
        }
        break :blk m;
    };

    comptime var i = 2;
    inline while (i * i <= max) : (i += 1) {
        if (!marks[i]) {
            comptime continue;
        }

        comptime var j = i * 2;
        inline while (j <= max) : (j += i) {
            marks[j] = false;
        }
    }
    return marks;
}

pub fn countPrimes(comptime marks: []const bool) usize {
    comptime var count = 0;
    return inline for (marks) |m| {
        if (m) count += 1;
    } else count;
}

pub fn primesComp(comptime marks: []const bool, comptime size: usize, comptime ps: *[size]u64) void {
    comptime var i = 0;
    inline for (marks, 0..) |m, j| {
        if (m) {
            ps[i] = j;
            i += 1;
        }
    }
}

test "primesComp" {
    @setEvalBranchQuota(2000000);
    const marks = comptime markPrimes(10000);
    const size = comptime countPrimes(&marks);
    std.debug.print("{}\n", .{size});
    comptime var ps: [size]u64 = undefined;
    comptime primesComp(&marks, size, &ps);
    for (ps) |p| {
        std.debug.print("{} ", .{p});
    }
    std.debug.print("\n", .{});
}

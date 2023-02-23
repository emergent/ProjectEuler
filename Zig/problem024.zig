// zig version 0.10.1
const std = @import("std");
const stdout = std.io.getStdOut().writer();

// #24 Lexicographic permutations - Project Euler
// http://projecteuler.net/problem=24
pub fn main() !void {
    var v = [_]u64{ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
    var i: u64 = 2;
    while (i <= 1000000) : (i += 1) {
        _ = nextPermutation(@TypeOf(v[0]), &v);
    }

    var ans: u64 = 0;
    var d: u64 = 1;
    var j: u64 = v.len;
    while (j > 0) {
        j -= 1;
        ans += v[j] * d;
        d *= 10;
    }

    try stdout.print("{}\n", .{ans});
}

fn nextPermutation(comptime T: type, items: []T) bool {
    const n = items.len - 1;
    if (n < 1) {
        return false;
    }

    var j = n - 1;
    while (!(items[j] < items[j + 1])) : (j -= 1) {
        if (j == 0) {
            return false;
        }
    }

    var l = n;
    while (!(items[j] < items[l])) {
        l -= 1;
    }
    std.mem.swap(T, &items[j], &items[l]);

    var k = j + 1;
    l = n;
    while (k < l) {
        std.mem.swap(T, &items[k], &items[l]);
        k += 1;
        l -= 1;
    }

    return true;
}

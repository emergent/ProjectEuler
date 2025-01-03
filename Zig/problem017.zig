// zig version 0.13.0
const std = @import("std");
const stdout = std.io.getStdOut().writer();

// #17 Number Letter Counts - Project Euler
// http://projecteuler.net/problem=17

fn count_strings(str: []const u8) usize {
    var count: usize = 0;
    var it = std.mem.splitScalar(u8, str, ' ');
    while (it.next()) |seq| {
        count += seq.len;
    }
    return count;
}

fn count_from_1_to_9() usize {
    return count_strings("one two three four five six seven eight nine");
}

fn count_from_10_to_19() usize {
    return count_strings("ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen");
}

fn count_from_20_to_99() usize {
    const tys = count_strings("twenty thirty forty fifty sixty seventy eighty ninety");
    return tys * 10 + count_from_1_to_9() * 8;
}

fn count_from_1_to_99() usize {
    return count_from_1_to_9() + count_from_10_to_19() + count_from_20_to_99();
}

fn count_from_100_to_999() usize {
    return count_from_1_to_9() * 100 + "hundred".len * 900 + "and".len * (900 - 9) + count_from_1_to_99() * 9;
}

fn count_1000() usize {
    return count_strings("one thousand");
}

pub fn main() !void {
    const ans = count_from_1_to_99() + count_from_100_to_999() + count_1000();

    try stdout.print("{}\n", .{ans});
}

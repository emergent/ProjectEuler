// zig version 0.13.0
const std = @import("std");
const stdout = std.io.getStdOut().writer();

// #18 Maximum Path Sum I - Project Euler
// http://projecteuler.net/problem=18
const TRIANGLE =
    \\75
    \\95 64
    \\17 47 82
    \\18 35 87 10
    \\20 04 82 47 65
    \\19 01 23 75 03 34
    \\88 02 77 73 07 63 67
    \\99 65 04 28 06 16 70 92
    \\41 41 26 56 83 40 80 70 33
    \\41 48 72 33 47 32 37 16 94 29
    \\53 71 44 65 25 43 91 52 97 51 14
    \\70 11 33 28 77 73 17 78 39 68 17 57
    \\91 71 52 38 17 14 91 43 58 50 27 29 48
    \\63 66 04 68 89 53 67 30 73 16 69 87 40 31
    \\04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
;

fn getMax(x: usize, y: usize, rest: usize, v: *const [15][15]u32) u32 {
    return switch (rest) {
        0 => v[y][x],
        else => v[y][x] + @max(getMax(x, y + 1, rest - 1, v), getMax(x + 1, y + 1, rest - 1, v)),
    };
}

pub fn main() !void {
    const triangle =
        blk: {
        var mat: [15][15]u32 = undefined;
        var rows = std.mem.split(u8, TRIANGLE, "\n");

        var i: usize = 0;
        while (rows.next()) |row| : (i += 1) {
            var cols = std.mem.split(u8, row, " ");
            var j: usize = 0;
            while (cols.next()) |cell| : (j += 1) {
                const val = try std.fmt.parseInt(u32, cell, 10);
                mat[i][j] = val;
            }
        }

        break :blk mat;
    };

    var dp: [15][15]u32 = .{.{0} ** 15} ** 15;
    dp[0][0] = triangle[0][0];
    for (0..triangle.len - 1) |i| {
        for (0..i + 1) |j| {
            dp[i + 1][j] = @max(dp[i][j] + triangle[i + 1][j], dp[i + 1][j]);
            dp[i + 1][j + 1] = @max(dp[i][j] + triangle[i + 1][j + 1], dp[i + 1][j + 1]);
        }
    }
    const ans = std.mem.max(u32, &dp[triangle.len - 1]);

    try stdout.print("{}\n", .{ans});
}

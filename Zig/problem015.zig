// zig version 0.11.0-dev
const std = @import("std");
const stdout = std.io.getStdOut().writer();

// #15 Lattice paths - Project Euler
// http://projecteuler.net/index.php?section=problems&id=15
pub fn main() !void {
    const n = 40;
    const k = 20;

    var matnxn: [n + 1][n + 1]u64 = undefined;
    var i: usize = 0;
    var j: usize = 0;

    while (i <= n) : (i += 1) {
        j = 0;
        while (j <= n) : (j += 1) {
            matnxn[i][j] = 0;
        }

        j = 0;
        while (j <= i) : (j += 1) {
            if (i == 0 or j == 0) {
                matnxn[i][j] = 1;
            } else {
                matnxn[i][j] = matnxn[i - 1][j - 1] + matnxn[i - 1][j];
            }
        }
    }

    try stdout.print("{}\n", .{matnxn[n][k]});
}

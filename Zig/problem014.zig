// zig version 0.11.0-dev
const std = @import("std");
const stdout = std.io.getStdOut().writer();

const N: u64 = 1_000_000;
var memo: [N + 1]u64 = .{0} ** (N + 1);

// #14 Longest Collatz sequence - Project Euler
// http://projecteuler.net/problem=14
pub fn main() !void {
    var ans: u64 = 0;
    var ans_count: u64 = 0;
    var i: u64 = 2;

    while (i < N) : (i += 1) {
        var x = i;
        var j: u64 = 0;
        while (true) {
            if (x < N and memo[x] > 0) {
                j += memo[x];
                //try stdout.print("{}: {}\n", .{ x, memo[x] });
                break;
            }
            if (x == 1) {
                break;
            }

            x = collatz(x);
            j += 1;
        }

        memo[i] = j;

        if (j > ans_count) {
            ans_count = j;
            ans = i;
        }
    }

    try stdout.print("{}\n", .{ans});
}

fn collatz(n: u64) u64 {
    return if (n % 2 == 0) (n / 2) else (n * 3 + 1);
}

test "longest" {
    var x: u64 = 837799;
    var i: u64 = 0;
    while (true) : (i += 1) {
        if (x == 1) break;
        x = collatz(x);
    }
}

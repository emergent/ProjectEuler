// zig version 0.11.1-dev
const std = @import("std");
const stdout = std.io.getStdOut().writer();

// #33 Digit cancelling fractions - Project Euler
// http://projecteuler.net/problem=33
pub fn main() !void {
    var prod_n: usize = 1;
    var prod_d: usize = 1;

    for (1..10) |n1| {
        for (1..10) |n2| {
            for (1..10) |d1| {
                for (1..10) |d2| {
                    const ns = [2]usize{ n1, n2 };
                    const ds = [2]usize{ d1, d2 };

                    if (a2d(&ns) >= a2d(&ds)) {
                        continue;
                    }

                    if (isCancellingFraction(&ns, &ds)) {
                        try stdout.print("{} / {}\n", .{ a2d(&ns), a2d(&ds) });

                        prod_n *= a2d(&ns);
                        prod_d *= a2d(&ds);
                    }
                }
            }
        }
    }

    const ans = prod_d / gcd(prod_n, prod_d);
    try stdout.print("{}\n", .{ans});
}

fn a2d(a: []const usize) usize {
    return a[0] * 10 + a[1];
}

fn isCancellingFraction(ns: []const usize, ds: []const usize) bool {
    const orig_n = a2d(ns);
    const orig_d = a2d(ds);

    for (0..2) |i| {
        for (0..2) |j| {
            if (ns[i] == ds[j] and ns[1 - i] * orig_d == orig_n * ds[1 - j]) {
                return true;
            }
        }
    }

    return false;
}

fn gcd(x: usize, y: usize) usize {
    return if (x == 0) y else gcd(y % x, x);
}

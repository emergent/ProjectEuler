// zig version 0.13.0
const std = @import("std");
const stdout = std.io.getStdOut().writer();

// #19 Counting Sundays - Project Euler
// http://projecteuler.net/problem=19
fn is_leap(year: u32) bool {
    return year % 400 == 0 or (year % 100 != 0 and year % 4 == 0);
}

fn count_sundays() u32 {
    const days_of_month = [_]u32{ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
    var days_amount: u32 = 0;
    var amount: u32 = 0;
    var y: u32 = 1901;

    while (y <= 2000) : (y += 1) {
        for (days_of_month, 1..) |ds, m| {
            if ((days_amount + 1) % 7 == 5) {
                amount += 1;
            }
            const days = if (m == 2 and is_leap(y)) ds + 1 else ds;
            days_amount += days;
        }
    }

    return amount;
}

pub fn main() !void {
    const ans = count_sundays();

    try stdout.print("{}\n", .{ans});
}

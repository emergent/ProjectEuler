const std = @import("std");
const stdout = std.io.getStdOut().writer();

fn summul(n: i32, x: i32) i32 {
    const count = @divTrunc(n, x);
    return x * @divTrunc(count * (1 + count), 2);
}

pub fn main() !void {
    try stdout.print("{}\n", .{summul(999, 3) + summul(999, 5) - summul(999, 15)});
}

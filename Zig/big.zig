const std = @import("std");
const stdout = std.io.getStdOut().writer();

pub const BigInt = struct {
    const Self = @This();

    inner: std.ArrayList(u8),

    pub fn init(alloc: std.mem.Allocator, val: u64) !Self {
        var inner = std.ArrayList(u8).init(alloc);
        var x = val;

        while (true) {
            try inner.append(@intCast(u8, x % 10));
            x /= 10;
            if (x <= 0) {
                break;
            }
        }

        return Self{ .inner = inner };
    }

    pub fn deinit(self: Self) void {
        self.inner.deinit();
    }

    pub fn len(self: Self) usize {
        return self.inner.items.len;
    }

    pub fn eq(self: Self, rhs: BigInt) bool {
        if (self.len() != rhs.len()) {
            return false;
        }

        for (self.inner.items, 0..) |digit, i| {
            if (digit != rhs.inner.items[i]) {
                return false;
            }
        }

        return true;
    }

    pub fn digits(self: *Self) *std.ArrayList(u8) {
        return &self.inner;
    }

    pub fn toString(self: Self, allocator: std.mem.Allocator) ![]u8 {
        const l = self.inner.items.len;
        var i: usize = l;

        var ret: []u8 = try allocator.alloc(u8, l);
        while (i > 0) : (i -= 1) {
            ret[i - 1] = self.inner.items[l - i] + '0';
        }

        return ret;
    }

    pub fn printDigits(self: Self) !void {
        try stdout.print("{{ ", .{});
        for (self.inner.items, 0..) |x, i| {
            if (i == 0) {
                try stdout.print("{}", .{x});
            } else {
                try stdout.print(", {}", .{x});
            }
        }
        try stdout.print(" }}\n", .{});
    }

    pub fn reset(self: *Self, rhs: *BigInt) !void {
        self.inner.clearAndFree();
        var i: usize = 0;
        while (i < rhs.inner.items.len) : (i += 1) {
            try self.inner.append(rhs.inner.items[i]);
        }
    }

    pub fn add(self: *Self, rhs: BigInt) !void {
        const l_len = self.len();
        const r_len = rhs.len();
        var carried: u8 = 0;

        for (self.inner.items, 0..) |*digit, i| {
            const d = if (i < r_len) digit.* + rhs.inner.items[i] + carried else digit.* + carried;

            digit.* = d % 10;
            carried = d / 10;
        }

        var i: usize = l_len;
        while (i < r_len) : (i += 1) {
            const d = rhs.inner.items[i] + carried;
            try self.inner.append(d % 10);
            carried = d / 10;
        }

        while (carried > 0) {
            try self.inner.append(carried % 10);
            carried /= 10;
        }
    }

    pub fn mul(self: *Self, rhs: BigInt) !void {
        var orig = try self.clone();
        defer orig.deinit();

        for (self.inner.items) |*d| {
            d.* = 0;
        }

        for (rhs.inner.items, 0..) |r, i| {
            var carried: u8 = 0;

            for (orig.inner.items, 0..) |o, j| {
                if (i + j < self.len()) {
                    const m = self.inner.items[i + j] + r * o + carried;
                    self.inner.items[i + j] = m % 10;
                    carried = m / 10;
                } else {
                    const m = r * o + carried;
                    try self.inner.append(m % 10);
                    carried = m / 10;
                }

                if (j == orig.inner.items.len - 1) {
                    var k: usize = 1;
                    while (carried > 0) : (k += 1) {
                        if (i + j + k < self.len()) {
                            const m = self.inner.items[i + j + k] + carried;
                            self.inner.items[i + j + k] = m % 10;
                            carried = m / 10;
                        } else {
                            try self.inner.append(carried % 10);
                            carried /= 10;
                        }
                    }
                }
            }
        }
    }

    pub fn exp(self: *Self, rhs: u32) !void {
        var r = try self.clone();
        defer r.deinit();

        var i: u32 = 1;
        while (i < rhs) : (i += 1) {
            try self.mul(r);
        }
    }

    fn clone(self: *Self) !BigInt {
        const inner = try self.inner.clone();
        return BigInt{ .inner = inner };
    }
};

const testing = std.testing;
const expect = std.testing.expect;
const expectEqual = std.testing.expectEqual;

test "init" {
    var b = try BigInt.init(testing.allocator, 10);
    defer b.deinit();

    try expectEqual(b.len(), 2);
    try expectEqual(b.digits().items[0], 0);
    try expectEqual(b.digits().items[1], 1);
}

test "add" {
    try expect(try helper_add(10, 21, 31));
}

test "mul" {
    try expect(try helper_mul(123, 456, 56088));
}

test "exp" {
    try expect(try helper_exp(1, 1, 1));
    try expect(try helper_exp(1, 100, 1));
    try expect(try helper_exp(2, 2, 4));
    try expect(try helper_exp(2, 3, 8));
    try expect(try helper_exp(3, 2, 9));
    try expect(try helper_exp(3, 3, 27));
    try expect(try helper_exp(123, 5, 28153056843));
}

fn helper_add(a: u64, b: u64, e: u64) !bool {
    var bl = try BigInt.init(testing.allocator, a);
    defer bl.deinit();

    var br = try BigInt.init(testing.allocator, b);
    defer br.deinit();

    var be = try BigInt.init(testing.allocator, e);
    defer be.deinit();

    try bl.add(br);
    return bl.eq(be);
}

fn helper_mul(a: u64, b: u64, e: u64) !bool {
    var bl = try BigInt.init(testing.allocator, a);
    defer bl.deinit();

    var br = try BigInt.init(testing.allocator, b);
    defer br.deinit();

    var be = try BigInt.init(testing.allocator, e);
    defer be.deinit();

    try bl.mul(br);
    return bl.eq(be);
}

fn helper_exp(a: u64, b: u32, e: u64) !bool {
    var bl = try BigInt.init(testing.allocator, a);
    defer bl.deinit();
    try bl.exp(b);

    const be = try BigInt.init(testing.allocator, e);
    defer be.deinit();

    return bl.eq(be);
}

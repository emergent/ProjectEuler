const std = @import("std");
const stdout = std.io.getStdOut().writer();
const allocator = std.heap.page_allocator;

pub fn BigInt(comptime T: type) type {
    return struct {
        const Self = @This();

        inner: std.ArrayList(T),

        pub fn init(alloc: std.mem.Allocator, val: T) !Self {
            var inner = std.ArrayList(T).init(alloc);
            var x = val;

            while (true) {
                try inner.append(x % 10);
                x /= 10;
                if (x <= 0) {
                    break;
                }
            }

            return Self{ .inner = inner };
        }

        pub fn deinit(self: Self) void {
            self.inner.deinit();
            return;
        }

        pub fn len(self: Self) usize {
            return self.inner.items.len;
        }

        pub fn eq(self: Self, rhs: BigInt(T)) bool {
            if (self.len() != rhs.len()) {
                return false;
            }

            for (self.inner.items) |digit, i| {
                if (digit != rhs.inner.items[i]) {
                    return false;
                }
            }

            return true;
        }

        pub fn digits(self: Self) std.ArrayList(T) {
            return self.inner;
        }

        pub fn printDigits(self: Self) !void {
            try stdout.print("{{ ", .{});
            for (self.inner.items) |x, i| {
                if (i==0) {
                    try stdout.print("{}", .{x});
                } else {
                    try stdout.print(", {}", .{x});
                }
            }
            try stdout.print(" }}\n", .{});
        }

        pub fn reset(self: *Self, rhs: BigInt(T)) !void {
            self.inner.clearAndFree();
            var i: usize = 0;
            while (i < rhs.inner.items.len) : (i += 1) {
                try self.inner.append(rhs.inner.items[i]);
            }
        }

        pub fn add(self: *Self, rhs: BigInt(T)) !*Self {
            const l_len = self.len();
            const r_len = rhs.len();
            var carried: T = 0;

            for (self.inner.items) |*digit, i| {
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

            return self;
        }
    };
}

const testing = std.testing;
const expect = std.testing.expect;
const expectEqual = std.testing.expectEqual;

test "init" {
    const b = try BigInt(u64).init(testing.allocator, 10);
    defer b.deinit();

    try expectEqual(b.len(), 2);
    try expectEqual(b.digits().items[0], 0);
    try expectEqual(b.digits().items[1], 1);
}

test "add" {
    var bl = try BigInt(u64).init(testing.allocator, 10);
    defer bl.deinit();

    const br = try BigInt(u64).init(testing.allocator, 21);
    defer br.deinit();

    const be = try BigInt(u64).init(testing.allocator, 31);
    defer be.deinit();

    const b1 = try bl.add(br);
    try expect(b1.eq(be));
}

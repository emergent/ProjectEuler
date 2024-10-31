// zig version 0.11.0-dev
const std = @import("std");
const stdout = std.io.getStdOut().writer();

// #22 Names scores - Project Euler
// http://projecteuler.net/problem=22
pub fn main() !void {
    const allocator = std.heap.page_allocator;
    try run(allocator);
}

fn run(allocator: std.mem.Allocator) !void {
    const file_name = "p022_names.txt";
    const file = try std.fs.cwd().openFile(file_name, .{});
    defer file.close();

    var reader = std.io.bufferedReader(file.reader());
    var stream = reader.reader();

    const file_size = try file.getEndPos();
    const contents = try stream.readAllAlloc(allocator, file_size);
    defer allocator.free(contents);

    var names = std.mem.split(u8, contents, ",");
    var nameList = std.ArrayList([]u8).init(allocator);
    defer nameList.deinit();

    while (names.next()) |name| {
        const unquoted = try allocator.alloc(u8, name.len - 2);
        std.mem.copyForwards(u8, unquoted, name[1..(name.len - 1)]);
        try nameList.append(unquoted);
    }

    var nameSlice = try nameList.toOwnedSlice();
    defer {
        for (nameSlice, 0..) |name, i| {
            nameSlice[i] = undefined;
            allocator.free(name);
        }
        allocator.free(nameSlice);
    }
    std.sort.block([]u8, nameSlice, {}, strcmp);

    var score: u64 = 0;
    for (nameSlice, 0..) |name, i| {
        var name_score: u64 = 0;
        for (name) |c| {
            name_score += c - 64;
        }
        score += name_score * (i + 1);
    }

    try stdout.print("{}\n", .{score});
}

fn strcmp(context: void, a: []u8, b: []u8) bool {
    _ = context;
    const len = if (a.len < b.len) a.len else b.len;
    var i: usize = 0;
    while (i < len) : (i += 1) {
        if (a[i] == b[i]) continue else if (a[i] < b[i]) return true else return false;
    } else {
        return if (a.len < b.len) true else false;
    }
}

test "detect leak" {
    try run(std.testing.allocator);
}

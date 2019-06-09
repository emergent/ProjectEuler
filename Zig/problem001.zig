//
// problem001
// Zig version: 
// Author: yosikawa
// Date: 2019-06-09
//
const warn = @import("std").debug.warn;

fn summul(n: i32, x: i32) i32 {
    const count = @divTrunc(n, x);
    return x * @divTrunc(count * (1 + count), 2);
}

pub fn main() void {
     warn("{}\n", summul(999, 3) + summul(999, 5) - summul(999, 15));
}

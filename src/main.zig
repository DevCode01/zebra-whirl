const std = @import("std");

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    var n: u32 = 30;
    if (args.len > 1) {
        n = std.fmt.parseInt(u32, args[1], 10) catch 30;
    }

    const stdout = std.io.getStdOut().writer();
    var i: u32 = 1;
    while (i <= n) : (i += 1) {
        if (i % 15 == 0) {
            try stdout.print("FizzBuzz\n", .{});
        } else if (i % 3 == 0) {
            try stdout.print("Fizz\n", .{});
        } else if (i % 5 == 0) {
            try stdout.print("Buzz\n", .{});
        } else {
            try stdout.print("{d}\n", .{i});
        }
    }
}

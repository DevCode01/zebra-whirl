const std = @import("std");

pub fn main(init: std.process.Init) !void {
    const io = init.io;
    const arena = init.arena.allocator();
    const args = try init.minimal.args.toSlice(arena);

    var n: u32 = 30;
    if (args.len > 1) {
        n = std.fmt.parseInt(u32, args[1], 10) catch 30;
    }

    var buf: [0x100]u8 = undefined;
    var w = std.Io.File.stdout().writer(io, &buf);
    const stdout = &w.interface;

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
    try stdout.flush();
}

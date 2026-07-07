const std = @import("std");

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    const stdout = std.io.getStdOut().writer();
    try stdout.print("{s} v0.1.0 - $DESC\n", .{"$NAME"});

    if (args.len > 1) {
        try stdout.print("Processing: {s}\n", .{args[1]});
    }
}

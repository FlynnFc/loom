const std = @import("std");

pub fn init(allocator: *std.mem.Allocator) void {
    _ = allocator;
    // TODO
    // If there's more advanced logging we can set it up here.
    // Currently, we rely on std.debug.*.
}

pub fn deinit() void {
    // TODO
    // Cleanup or close files if needed.
}

// A few convenience functions for logging:
pub fn info(msg: []const u8, args: anytype) void {
    _ = args;
    std.debug.print("[INFO] {s}\n", .{msg});
}

pub fn errorF(msg: []const u8, args: anytype) void {
    std.debug.print("[ERROR] {s}\n", .{std.fmt.format(msg, args)});
}

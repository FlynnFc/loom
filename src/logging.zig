const std = @import("std");

pub fn init(allocator: *std.mem.Allocator) void {
    _ = allocator;
    // If you have more advanced logging, set it up here.
    // Currently, we rely on std.debug.*.
}

pub fn deinit() void {
    // Cleanup or close files if needed.
}

// A few convenience functions for logging:
pub fn info(msg: []const u8, args: anytype) void {
    std.debug.print("[INFO] {s}\n", .{std.fmt.format(msg, args)});
}

pub fn errorF(msg: []const u8, args: anytype) void {
    std.debug.print("[ERROR] {s}\n", .{std.fmt.format(msg, args)});
}

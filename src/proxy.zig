const std = @import("std");
const log = @import("logging.zig"); // Adjust this module as needed
const posix = std.posix;

pub fn runProxy(
    allocator: *std.mem.Allocator,
    config: anytype, // Simplified config containing a .listen_port field (u16)
    endpoints: []std.mem.TokenIterator(u8, std.mem.DelimiterType.any),
) !void {
    // Parse a listening address on all interfaces
    const listen_addr = try std.net.Address.parseIp("0.0.0.0", config.listen_port);
    // Create a listener (with a backlog of 128)
    var listener = try listen_addr.listen(.{ .kernel_backlog = 128 });
    defer listener.deinit();

    log.info("Listening on port {d}...", .{config.listen_port});

    // Round-robin index for endpoint selection
    var idx: usize = 0;
    while (true) {
        // Accept a new connection
        var conn = try listener.accept();
        {
            // Ensure we close the connection when done.
            defer conn.close();
            // Handle the connection (in production you might spawn a separate task)
            handleConnection(conn.stream, endpoints, &idx, allocator) catch |e| {
                log.errorF("Connection error: {s}", .{e});
            };
        }
    }
}

fn handleConnection(
    conn: std.net.Stream,
    endpoints: []std.mem.TokenIterator(u8, std.mem.DelimiterType.any),
    round_robin_idx: *usize,
    allocator: *std.mem.Allocator,
) !void {
    _ = allocator;
    // TODO
    // Pick an endpoint in a round-robin fashion
    // Parse the port number from the second token
    // Build the destination address from IP and port
    // Connect outbound
    // Naively read from client and write to destination
    // And then read from destination and write back to client

}

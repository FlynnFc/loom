const std = @import("std");
const log = @import("logging.zig");

pub fn runProxy(
    allocator: *std.mem.Allocator,
    config: anytype, // Simplified
    endpoints: []std.mem.TokenizedString,
) !void {
    var listener = try std.net.listenIPv4(config.listen_port, 128);
    defer listener.deinit();

    log.info("Listening on port {d}...", .{config.listen_port});

    _ = allocator;
    // Round-robin index
    var idx: usize = 0;

    while (true) {
        const conn = try listener.accept();
        // Dispatch the connection in a separate task if you have async/threads
        handleConnection(conn, endpoints, &idx) catch |e| {
            log.errorF("Connection error: {s}", .{e});
        };
    }
}

fn handleConnection(
    conn: std.net.Connection,
    endpoints: []std.mem.TokenizedString,
    round_robin_idx: *usize,
) !void {
    // Get an endpoint in round-robin fashion
    const next_idx = *round_robin_idx % endpoints.len;
    round_robin_idx.* += 1;
    // For simplicity, assume the endpoints have two tokens: [IP, PORT]
    // e.g. "10.42.0.10" and "9000"
    const ip_port = endpoints[next_idx];
    const ip = ip_port[0];
    const port_str = ip_port[1];

    const maybe_port = std.fmt.parseInt(u16, port_str, 10);
    if (maybe_port != null) |dest_port| {
        // Connect to the destination
        var dest_conn = try std.net.Connection.connectIp4String(ip, dest_port);
        defer dest_conn.deinit();

        // Proxy data between conn <-> dest_conn
        // This is a naive, blocking approach.
        // For production, we async I/O or concurrency
        // so you we forward data in both directions.

        // Forward client -> service
        var buf_in: [1024]u8 = undefined;
        const read_bytes = try conn.read(buf_in[0..]);
        if (read_bytes > 0) {
            _ = try dest_conn.write(buf_in[0..read_bytes]);
        }
        // Forward service -> client
        const service_read = try dest_conn.read(buf_in[0..]);
        if (service_read > 0) {
            _ = try conn.write(buf_in[0..service_read]);
        }

        // Log the success
        log.info("Proxied request from client to {s}:{s} - Round robin idx: {d}", .{ ip, port_str, next_idx });
    } else {
        log.errorf("Invalid port number in endpoint: {s}", .{port_str});
    }

    // Cleanup
    conn.deinit();
}

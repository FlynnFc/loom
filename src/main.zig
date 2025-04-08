const Config = @import("config.zig");
const Discovery = @import("discovery.zig");
const Proxy = @import("proxy.zig");
const log = @import("logging.zig");
const std = @import("std");
pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    var allocator = gpa.allocator();

    // Load/parse config. In production, you might load from
    //    environment variables, config files, or command line args.
    const config = Config.Config{
        .listen_port = 8080,
        .kube_api_url = "https://kubernetes.default.svc", // placeholder
        .service_name = "example-service",
        .discovery_enabled = true,
    };

    // Initialize your logger
    log.init(&allocator);
    defer log.deinit();
    log.info("Starting loom Service Mesh", .{});

    // Kubernetes service discovery
    const endpoints = if (config.discovery_enabled)
        try Discovery.discoverEndpoints(&allocator, config)
    else
        // Hardcode for local testing
        &[_]std.mem.Tok{std.mem.tokenizeAny("127.0.0.1:9000", ":")};

    // Start the proxy that listens on config.listen_port
    log.info("Initializing proxy...", .{});
    try Proxy.runProxy(&allocator, config, endpoints);
}

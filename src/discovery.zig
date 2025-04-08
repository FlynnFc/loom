const std = @import("std");
const Config = @import("config.zig");

pub fn discoverEndpoints(allocator: *std.mem.Allocator, config: Config.Config) ![]std.mem.TokenIterator(u8, std.mem.DelimiterType.any) {
    // Placeholder for discovering endpoints from the K8s API.
    //
    _ = config;
    // TODO
    // Grab a service account token
    // Query the Kubernetes API for the endpoints of `config.service_name`
    // Parse & return them in a list
    //
    // For now, we just return a static slice of endpoints.
    var endpoints = try allocator.alloc(std.mem.TokenIterator(u8, std.mem.DelimiterType.any), 2);
    // e.g., "10.42.0.10:9000" "10.42.0.11:9000"
    endpoints[0] = std.mem.tokenizeAny(u8, "10.42.0.10:9000", ":");
    endpoints[1] = std.mem.tokenizeAny(u8, "10.42.0.11:9000", ":");
    return endpoints;
}

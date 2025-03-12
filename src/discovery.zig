const std = @import("std");
const Config = @import("config.zig");

pub fn discoverEndpoints(allocator: *std.mem.Allocator, config: Config.Config) ![]std.mem.TokenizedString {
    // Placeholder for discovering endpoints from the K8s API.
    //
    _ = config;
    // 1) Grab a service account token
    // 2) Query the Kubernetes API for the endpoints of `config.service_name`
    // 3) Parse & return them in a list
    //
    // For now, we just return a static slice of endpoints.
    var endpoints = try std.heap.arrayBufferAlloc(&std.mem.TokenizedString, allocator, 2);
    // e.g., "10.42.0.10:9000" "10.42.0.11:9000"
    endpoints[0] = std.mem.tokenizeString("10.42.0.10:9000", ":");
    endpoints[1] = std.mem.tokenizeString("10.42.0.11:9000", ":");
    return endpoints;
}

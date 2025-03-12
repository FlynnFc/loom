// Basic configuration struct.
// Extend with fields for more advanced features.
pub const Config = struct {
    listen_port: u16,
    kube_api_url: []const u8, // placeholder for K8s discovery
    service_name: []const u8,
    discovery_enabled: bool,
};

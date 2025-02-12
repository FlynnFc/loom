<p align="center">
  
  <img  width="200" src="https://github.com/user-attachments/assets/7aaac5a9-aa22-4406-8524-0ba4816a2171" alt="Centered Image"/>
  <h1 align="center">Warden</h1>
</p>

<p align="center">
  ⚡👮‍♂️A Zig-Based Service Mesh for Kubernetes – For Learning, Building, and Exploring.👮‍♂️⚡
</p>

<p align="center">

  <!-- <img src="https://github.com/flynnfc/bagginsdb/actions/workflows/build.yml/badge.svg" alt="Build badge"> -->

  <a href="https://github.com/flynnfc/BagginsDB/blob/main/LICENSE.md">
    <img src="https://img.shields.io/badge/license-MIT-blue" alt="MIT" title="MIT License" />
  </a>

</p>

## Overview

Welcome to **Warden**! This project is my personal exploration into the world of service meshes, inspired by Envoy and built using the Zig programming language. The primary goal is educational: to gain hands-on experience with Kubernetes, understand microservices networking, and explore the design and implementation challenges of a service mesh 🕸️.

## Why Warden?

- **📖 Educational Journey:** I’m building Warden to deepen my understanding of Kubernetes internals, traffic management, observability, chaos testing and the intricacies of service-to-service communication.
- **🕵️ Zig Exploration:** Zig’s performance, safety, and simplicity make it an excellent candidate for building low-level, high-performance systems like a service mesh.

## What Warden Does

At its core, Warden is designed to:

- **🚦 Manage Traffic:** Route, load balance, and implement basic circuit breaking between services.
- **👀 Enhance Observability:** Collect logs, metrics, and provide tracing hooks to monitor service interactions.
- **👮 Enforce Security:** Facilitate secure communication (e.g., TLS) between microservices.
- **🪢 Integrate with Kubernetes:** Discover services and endpoints dynamically through the Kubernetes API.

## Roadmap

### **MVP**

- **🛻 Basic Traffic Routing:** Implement fundamental request routing between services.
- **⚖️ Load Balancing:** Distribute requests evenly across available service instances.
- **🪵 Logging & Metrics:** Integrate simple logging and metrics to monitor traffic and health.
- **🪄 Kubernetes Service Discovery:** Connect with the Kubernetes API to dynamically fetch service endpoints.

### **Next Steps**

- **🦜 mTLS Integration:** Secure service-to-service communication using mutual TLS.
- **🧑‍⚖️ Advanced Routing Policies:** Add features such as retries, timeouts, and basic circuit breaking.
- **🧵 Distributed Tracing:** Introduce hooks for tracing requests across services for better observability.
- **✍️ Dynamic Configuration:** Enable hot-reloading and runtime configuration changes via Kubernetes CRDs or similar mechanisms.

### **Future Explorations**

- **⁉️ Fault Injection & Testing:** Simulate failures to test resiliency.
- **🛣️ Policy-Based Routing:** Experiment with routing based on custom policies and metadata.
- **🐢 Rate Limiting & Quotas:** Implement traffic control mechanisms to prevent service overload.

## Getting Started

### Prerequisites

- [Zig Compiler](https://ziglang.org/)
- Access to a Kubernetes cluster (local setups like [Kind](https://kind.sigs.k8s.io/) or [Minikube](https://minikube.sigs.k8s.io/) work well)
- Basic knowledge of Kubernetes and microservices concepts

### Installation

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/yourusername/warden.git
   cd warden
   ```
2. **Build Warden:**
   ```bash
   zig build
   ```
3. **Deploy to Kubernetes:**
   - Follow the deployment instructions in the `deploy/` directory to integrate Warden with your Kubernetes cluster.


## Contributing

I welcome contributions, ideas, and feedback! If you’re interested in exploring the internals of service meshes or have suggestions for new features (or educational experiments), please open an issue or submit a pull request.


## License

Warden is released under the [MIT License](LICENSE).



_🛡️🕸️⚡_

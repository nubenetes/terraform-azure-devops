[ Previous: 131. Internal Developer Platform](131-INTERNAL_DEVELOPER_PLATFORM.md) | [ Home](../README.md) | [ Next: 211. Module Design Patterns](211-TERRAFORM_MODULE_DESIGN_PATTERNS.md)

---

# 141. Architecture Adoption and IPAM Guide

---

## 📑 Table of Contents

- [1. Strategy 2026: Adapting the Blueprint for Real-World Deployments](#1-strategy-2026-adapting-the-blueprint-for-real-world-deployments)
- [2. IPAM Reference Matrix: Obfuscated vs Recommended Values](#2-ipam-reference-matrix-obfuscated-vs-recommended-values)
- [3. The Golden Rule of Terraform Variables and tfvars](#3-the-golden-rule-of-terraform-variables-and-tfvars)
- [4. Subnetting Logic and cidrsubnet Math](#4-subnetting-logic-and-cidrsubnet-math)
- [5. De-Obfuscation Guide: Find and Replace for UDRs](#5-de-obfuscation-guide-find-and-replace-for-udrs)
- [6. Public Network Access and Authorized IP Ranges](#6-public-network-access-and-authorized-ip-ranges)
- [7. Validated Reference Library (Official and Community)](#7-validated-reference-library-official-and-community)

---

## 1. Strategy 2026: Adapting the Blueprint for Real-World Deployments

This repository utilizes a **Zero-Knowledge Documentation** approach where sensitive network telemetry, CIDR ranges, and organizational identifiers have been intentionally obfuscated (e.g., using `127.0.0.1/x` ranges) to protect architectural confidentiality. To implement this blueprint in a production environment, engineers must "de-obfuscate" these values and replace them with a valid **IP Address Management (IPAM)** strategy.

## 2. IPAM Reference Matrix: Obfuscated vs Recommended Values

The following table provides a mapping between the obfuscated values found in this repository and the recommended RFC 1918 private addressing standards for enterprise deployments.

| Component | Obfuscated Value (Repo) | Recommended Value (Production) | Rationale |
| :--- | :--- | :--- | :--- |
| **Global Backbone (Hub)** | `127.0.0.1/8` | `10.0.0.0/16` | Sufficient space for centralized services and firewalls. |
| **AKS Cluster Nodes** | `127.0.0.1/19` | `10.240.0.0/16` | Required for Azure CNI scaling (nodes and dynamic IP allocation). |
| **Application Gateway Subnet** | `127.0.0.1/24` | `10.1.1.0/24` | Spoke allocation. Azure standard for L7 traffic orchestration. |
| **PaaS Integration Subnets** | `127.0.0.1/27` | `10.1.10.0/24` | Spoke allocation for Private Endpoints and integration. |
| **Default Internet Route** | `127.0.0.1/0` | `0.0.0.0/0` | Standard UDR for next-hop Internet or Firewall. |

## 3. The Golden Rule of Terraform Variables and tfvars

To maintain the integrity of the modular architecture while adapting it to your organization, follow the **Golden Rule of Variable Orchestration**:

1.  **Do Not Modify Defaults**: Avoid editing the `default` values in `variables.tf` files. These values are intentionally set to safe loopback ranges (`127.0.0.1/x`) to prevent accidental deployment of unconfigured infrastructure.
2.  **Externalize Configuration**: Always use environment-specific `.tfvars` files (e.g., `prod-cus.tfvars`) to inject your real CIDR ranges.
3.  **Variable Precedence**: Terraform will automatically prioritize values from `.tfvars` over the defaults in the module manifests.

## 4. Subnetting Logic and cidrsubnet Math

This repository relies on consistent subnetting ratios. When choosing a new `address_space` for a VNet, ensure that your subnets maintain the required bit-masks for scaling.

*   **AKS Scaling**: A `/19` mask is used for the AKS subnet to prevent IP exhaustion during high-churn rolling updates and Pod scaling.
*   **Logical Calculation**: Use the `cidrsubnet(prefix, newbits, netnum)` function in your `locals.tf` to programmatically derive subnets from a root VNet CIDR, ensuring no overlaps and easier refactoring.

## 5. De-Obfuscation Guide: Find and Replace for UDRs

In some cases, User-Defined Routes (UDRs) for direct internet access have been hardcoded as comments using the loopback range. To safely revert these to standard internet routes, you can use the following terminal command in your local environment before deployment:

```bash
# Safely replace obfuscated internet routes with standard 0.0.0.0/0
find . -type f -name "*.tf" -exec sed -i 's/127\.0\.0\.1\/0/0.0.0.0\/0/g' {} +
```

*Note: Always verify the changes with `git diff` before applying Terraform logic.*

## 6. Public Network Access and Authorized IP Ranges

For security-hardened clusters, the AKS API Server uses **Authorized IP Ranges**.

*   **Repo Placeholder**: The code often uses `127.0.0.1/32` as a placeholder for these ranges.
*   **Adoption Step**: You MUST replace this with your organization's public egress IPs (VPN, Office, or CI/CD runner IPs) to allow the Terraform pipeline or administrative consoles to interact with the Kubernetes API.
*   **Hardening**: Ensure `public_network_access_enabled = true` is only used if you have correctly configured these authorized ranges.

## 7. Validated Reference Library (Official and Community)

*   **[Azure IPAM Best Practices](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/plan-for-ip-addressing)**: Official Microsoft guide for planning IP addressing.
*   **[Terraform cidrsubnet Function](https://developer.hashicorp.com/terraform/language/functions/cidrsubnet)**: Documentation for programmatic subnetting.
*   **[RFC 1918](https://datatracker.ietf.org/doc/html/rfc1918)**: Address Allocation for Private Internets.

---

[ Previous: 131. Internal Developer Platform](131-INTERNAL_DEVELOPER_PLATFORM.md) | [ Home](../README.md) | [ Next: 211. Module Design Patterns](211-TERRAFORM_MODULE_DESIGN_PATTERNS.md)

---

*Technical Documentation: Architecture Adoption and IPAM Guide | Vision 2026 Architectural Guide*

---

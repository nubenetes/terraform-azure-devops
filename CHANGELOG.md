# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.3.0] - 2026-06-08

### Added
- **AI Usage Clarification**: Formally documented the distinction between the **human-crafted code base** (Terraform, YAML, scripts) and the **AI-enhanced documentation** (README, docs inventory, NotebookLM). This ensures transparency regarding technical provenance.

### Changed
- **Provenance Documentation**: Updated `docs/121-PROVENANCE_AND_LEGAL.md` and the root `README.md` to reflect the repository's "Human-Crafted" quality benchmark for core engineering logic.

## [1.2.0] - 2026-06-08

### Added
- **Repository Engineering Metrics (v2)**: Integrated advanced repository analytics into the root `README.md`, including a new dedicated column for `.tfvars` Data Orchestration files.
- **Enhanced Data Visualization**: Updated Mermaid distribution charts to reflect the growth of the codebase and the complexity of the environment configuration layer (535 total files).
- **Orchestration Layer Visibility**: Formally recognized the `.tfvars` configuration files as a core architectural pillar in the repository metrics.

### Changed
- **Metric Recalculation**: Updated global counts for `App-Core`, `Identity`, and `Day2 Ops` modules to include recent architectural expansions and documentation assets.

## [1.1.0] - 2026-06-08

### Added
- **NotebookLM Technical Assets**: Integrated high-fidelity AI-generated video summaries and technical slides to the core documentation.
- **Data Orchestration Infographic**: Added a new visual blueprint for environment configuration and `.tfvars` orchestration in `docs/213-TERRAFORM_ENVIRONMENT_CONFIGURATION_AND_TFVARS_INVENTORY.md`.
- **Categorized Learning Series**: Structured the `README.md` to include categorized technical deep-dives for Identity, MLOps, and Infrastructure Engine logic.

### Changed
- **Documentation Restructuring**: Reorganized the Strategic Presentations section in the root `README.md` for better discoverability and technical narrative.

## [1.0.1] - 2026-06-08 (Deprecated/Internal)
*(Merged into 1.1.0)*

---

## [1.0.0] - 2026-06-07

### Added
- **Enterprise IaC Baseline**: End-to-end infrastructure automation for Azure (AKS, App Service, Networking, Cosmos DB) using Terraform.
- **CI/CD Orchestration**: Standardized Azure DevOps pipelines for deployment, destruction, and state management across all modules.
- **Identity and Governance**: Implemented Entra ID integration, RBAC structures, and automated identity governance (Groups, Roles, CAP).
- **Environment Parity**: Automated configuration via anonymized `.tfvars` for consistent ENG (DEV/QA/UAT) and PRO environments.
- **Architectural Documentation**: Comprehensive "Vision 2026" guide including Mermaid diagrams and deep-dive technical manuals.

### Changed
- **Terminology Harmonization**: Unified product names, module identifiers, and container registry standards (`enterpriseappcr`).
- **Standardization**: Aligned all manifests and documentation with the Vision 2026 Architectural Guide.

### Fixed
- **UI/UX Optimization**: Implemented collapsible blocks for large-scale architectural diagrams to improve documentation readability.

### Security
- **Data Hardening**: Full anonymization of organizational identifiers, execution timestamps, and sensitive metadata across all assets.
- **Zero-Trust Architecture**: Enforced Managed Identities (MSI), OIDC Workload Identity, and compound identity trust patterns.
- **Infrastructure Security**: Integrated Azure RBAC for Key Vault/Storage access and enforced HTTPS/VNet-integration defaults.

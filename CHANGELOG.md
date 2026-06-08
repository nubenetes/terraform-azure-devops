# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.1] - 2026-06-08

### Added
- **NotebookLM Technical Assets**: Integrated high-fidelity AI-generated video summaries and technical slides to the core documentation.
- **Data Orchestration Infographic**: Added a new visual blueprint for environment configuration and `.tfvars` orchestration in `docs/213-TERRAFORM_ENVIRONMENT_CONFIGURATION_AND_TFVARS_INVENTORY.md`.
- **Categorized Learning Series**: Structured the `README.md` to include categorized technical deep-dives for Identity, MLOps, and Infrastructure Engine logic.

### Changed
- **Documentation Restructuring**: Reorganized the Strategic Presentations section in the root `README.md` for better discoverability and technical narrative.

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

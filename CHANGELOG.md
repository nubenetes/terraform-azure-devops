# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.0] - 2026-06-07

### Added
- **Configuration**: Added thoroughly anonymized `.tfvars` files for environment parity across all modules (AKS, Day2-ops, App-Core, App-Catalog, Shared-Infra).
- **Identity Governance**: Implemented role-based anonymous user identities (`admin.user`, `dev.user`) to preserve original permission structures.

### Changed
- **Terminology Harmonization**: Standardized and harmonized internal product names and module identifiers across all manifests and documentation to align with current architectural standards.
- **Registry Standards**: Updated container registry names to the unified `enterpriseappcr` standard.

## [1.0.1] - 2026-06-03

### Added
- **Documentation**: Uploaded missing architectural and rollback process flow images for App-Users and Shared-Infra modules.

## [1.0.0] - 2026-05-24

### Added
- **Enterprise Terraform & Azure DevOps Baseline**: Initial stable release featuring end-to-end infrastructure automation and CI/CD procedures.
- **Multi-Cloud Scalability**: Support for Azure core infrastructure (Network, App Service, MongoDB) via Terraform.
- **Release Automation**: Integrated Azure DevOps pipelines for standardized deployment lifecycles.

### Fixed
- **Performance Optimization**: Implemented collapsible Mermaid blocks for large-scale architectural diagrams.

### Security
- **Data Hardening**: Comprehensive anonymization of execution timestamps and organizational identifiers across all scripts and manifests.

## [1.0.0-rc.1] - 2026-05-22

### Security
- **Selective Timestamp Anonymization**: Surgically replaced original database execution timestamps in `App-Core/scripts/04-mongodump.sh` with generic placeholders to obscure the original operation timeline.

### Added
- **Initial Baseline**: Consolidated enterprise cloud infrastructure manifests and documentation according to the Vision 2026 Architectural Guide.

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.8.8] - 2026-06-12

### Added
- **Orchestration Flow Expansion**: Integrated a new high-fidelity blueprint from the `tmp14` inventory, reaching a total of 42 architectural visualizations:
    - **Global Configuration Pipeline Variable Flow**: A deep-dive into the deterministic flow of variables across global orchestration layers.

## [1.8.7] - 2026-06-12

### Added
- **Global Infographic Expansion**: Integrated 6 additional high-fidelity blueprints from the `tmp13` inventory, reaching a total of 41 architectural visualizations:
    - **Multi-Tenant Identity Governance Infographic (AE Title)**
    - **Managed AKS Cluster Certificate Bridge Workflow**
    - **Cloud Infrastructure Global Variable Architecture Vision**
    - **Strategic Architecture Roadmap Evolution**
    - **Enterprise Architecture AKS Modernization Roadmap**
    - **Database Roadmap Evolution and Architecture Shift (Cosmos DB)**
- **Extended Roadmap Gallery**: Reorganized the future evolution category to include the new domain-specific roadmaps for AKS and Database modernization.

## [1.8.6] - 2026-06-12

### Changed
- **IPAM Alignment**: Synchronized the "IPAM Reference Matrix" in `docs/141-ARCHITECTURE_ADOPTION_AND_IPAM_GUIDE.md` with the "Representative Allocation Patterns" declared in the `README.md` header to ensure architectural consistency.
- **Topology Refinement**: Updated recommended production CIDRs (10.0.0.0/16, 10.1.0.0/16, 10.240.0.0/16) to reflect the Hub-and-Spoke and AKS networking standards of the blueprint.

## [1.8.5] - 2026-06-12

### Fixed
- **Documentation Standards**: Added missing bottom navigation bar to `docs/141-ARCHITECTURE_ADOPTION_AND_IPAM_GUIDE.md` to comply with the project's Dual Navigation mandate.

### Changed
- **Header Integration**: Added a direct strategic link to the Architecture Adoption Guide from the "Network and Access Anonymization Notice" in the root `README.md`.

## [1.8.4] - 2026-06-12

### Added
- **Architecture Adoption and IPAM Guide**: Integrated a new strategic manual (`docs/141-ARCHITECTURE_ADOPTION_AND_IPAM_GUIDE.md`) to facilitate the de-obfuscation of the repository's network CIDRs.
- **De-Obfuscation Strategy**: Formally documented the "IPAM Reference Matrix" and the "Golden Rule" for variable injection via `.tfvars` to ensure safe real-world implementations.
- **Developer Utility**: Provided a safe find-and-replace command for reverting hardcoded UDR loopback placeholders to standard internet routes.

## [1.8.3] - 2026-06-12

### Changed
- **Roadmap Consolidation**: Reordered the infographic gallery to move the high-fidelity enterprise blueprint and the AI-assisted roadmap to the final "Future Roadmap and Evolution" category.
- **Sequential Renumbering**: Updated all 35 architectural blueprints to maintain a clean numerical sequence (1-35) following the structural correction.

## [1.8.2] - 2026-06-12

### Added
- **Expanded Infographic Collection**: Integrated 6 new high-fidelity blueprints from the `tmp12` inventory, reaching a total of 35 architectural visualizations:
    - **Vision 2026 Enterprise Infrastructure Blueprint (High-Fidelity)**
    - **Shared Infrastructure Ecosystem**
    - **Cloud Governance, RBAC and Subscriptions**
    - **Identity-Driven Infrastructure Automation (OAuth 2.0)**
    - **Infrastructure State Command Center (.tfstate Logic)**
    - **Infrastructure Automation Roadmap 2026 (AI-Assisted IaC)**

### Changed
- **Advanced Gallery Categorization**: Restructured the root `README.md` infographic gallery into 8 specialized strategic categories to improve architectural discoverability and accommodate the growing collection.
- **UI/UX Optimization**: Refined the gallery layout to eliminate formatting gaps between dropdowns and ensured sequential numbering across all 35 blueprints.

## [1.8.1] - 2026-06-11

### Added
- **Orchestration and Operations Blueprints**: Integrated two new high-fidelity infographics from the `tmp11` inventory:
    - **Blueprint 21**: Cloud Infrastructure Orchestration Engine (Azure DevOps Pipelines).
    - **Blueprint 22**: Post-Deployment Infrastructure Operations Hierarchy (Day 2 Ops).
- **Gallery Expansion**: Updated the categorized gallery to include these new deep-dives within the Infrastructure Pillars section, expanding the total collection to 29 blueprints.

## [1.8.0] - 2026-06-11

### Added
- **Global Infographic Gallery**: Integrated 13 additional high-fidelity infographics from the temporary inventory, expanding the collection to 27 architectural visualizations.
- **Categorized Visual Experience**: Reorganized the root `README.md` infographic section into four strategic clusters:
    - **Strategic Vision**: High-level blueprints and executive summaries.
    - **Infrastructure Pillars**: Low-level technical anatomy and deep-dives into Networking, Identity, and Compute.
    - **IaC Engine**: Variables orchestration, tfvars flow, and module composition strategies.
    - **Future Evolution**: Roadmap focusing on Terraform Stacks.
- **Master Gallery Toggle**: Implemented a "Show All" master dropdown to allow simultaneous viewing of all 27 blueprints, improving architectural assimilation.

## [1.7.7] - 2026-06-10

### Added
- **Infrastructure Evolution Blueprint**: Integrated a new high-fidelity infographic focusing on Terraform Stacks and Module Versioning strategies within the Vision 2026 framework.

## [1.7.6] - 2026-06-10

### Added
- **Module Orchestration Blueprints**: Integrated two new high-fidelity infographics comparing Composite vs. Atomic Terraform module strategies and orchestration architecture.

## [1.7.5] - 2026-06-10

### Security
- **Network Anonymization Notice**: Integrated a comprehensive security notice in the root `README.md` header, documenting the anonymization of CIDR ranges, VNet addresses, and access whitelists to protect architectural confidentiality.

## [1.7.4] - 2026-06-10

### Added
- **Detailed .tfvars Blueprints**: Integrated three new high-fidelity infographics focused on the Terraform variable engine and environment configuration flow.

### Changed
- **Performance Optimization**: Consolidated all infographics in `docs/213-TERRAFORM_ENVIRONMENT_CONFIGURATION_AND_TFVARS_INVENTORY.md` into an expandable dropdown to mitigate network latency and improve page load experience.
- **Documentation Scaling**: Expanded the root `README.md` blueprint collection to 11 distinct architectural visualizations.

## [1.7.3] - 2026-06-10

### Added
- **High-Fidelity Blueprints**: Integrated new architectural infographics from the Vision 2026 collection, including a Strategy Blueprint and a Spanish edition for broader accessibility.

### Changed
- **Documentation Layout**: Consolidated all architectural blueprints into an expandable dropdown section in the root `README.md` to enhance readability and prioritize technical content.

## [1.7.2] - 2026-06-09

### Changed
- **Global Asset Normalization**: Completed the removal of Spanish accents from all asset filenames (videos) to ensure universal compatibility across all operating systems and web browsers.

## [1.7.1] - 2026-06-09

### Changed
- **Asset Normalization**: Renamed newly integrated video assets to remove Spanish accents from filenames, ensuring better cross-platform compatibility and resolving potential URI encoding issues.

## [1.7.0] - 2026-06-09

### Added
- **High-Fidelity Architectural Blueprints**: Integrated a new series of high-resolution infographics covering high-level blueprints, low-level technical anatomy, and DevSecOps patterns, all accessible via a new collapsible gallery in the root `README.md`.
- **Domain-Specific Technical Assets**:
    - **App-Core and App-Catalog**: Added comprehensive video guides and technical blueprints (PDF) for the core application and service registry modules.
    - **DNS and Networking Deep-Dives**: Integrated new IaC video summaries and technical presentations focused on the decoupling of DNS infrastructure and module-specific orchestration.

## [1.6.0] - 2026-06-09

### Added
- **Hybrid Integration Assets**: Integrated new technical assets for the Integration Service, including a universal connector architecture blueprint (PDF) and video guides (MP4) in both English and Spanish, covering AppLink signaling and legacy connectivity patterns.

## [1.5.0] - 2026-06-09

### Added
- **Networking and DNS Technical Assets**: Integrated new NotebookLM-generated high-fidelity assets, including a dynamic infrastructure blueprint (PDF) and technical video summaries (MP4) in both English and Spanish, covering Hub-Spoke and DNS orchestration.

## [1.4.0] - 2026-06-08

### Added
- **GitFlow Development Model**: Added a high-fidelity visualization of the Azure DevOps GitFlow model (`azure-devops-gitflow-based-devel-model-shared-infra.png`) across Shared Infrastructure and AKS documentation tiers.

### Changed
- **App Service Observability**: Updated the App Service Log Stream screenshot (`log-stream-in-azure-app-service-debugconsole.png`) with an improved, correctly cropped version for better visual clarity.

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

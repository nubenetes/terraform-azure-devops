# Terraform - Deploy to Multiple Regions Using Providers https://www.youtube.com/watch?v=9f-NrYZ5tQg

# Best Practices for Provider Versions
# https://developer.hashicorp.com/terraform/language/providers/requirements
# https://developer.hashicorp.com/terraform/language/expressions/version-constraints
# A module intended to be used as the root of a configuration — that is, as the directory where you'd run terraform apply — should also specify the maximum provider version it is intended to work with,
# to avoid accidental upgrades to incompatible new versions. The ~> operator is a convenient shorthand for allowing the rightmost component of a version to increment.

terraform {
  required_version = "~> 1.4.5"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 3.52.0"
      # Due to the fast-moving nature of AKS, we recommend using the latest version of the Azure Provider when using AKS
      # https://docs.microsoft.com/en-us/azure/developer/terraform/provider-version-history-azurerm
    }
    # Configure the Azure Active Directory Provider
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.37.0"
      # 2.34.0 issue found: https://github.com/hashicorp/terraform-provider-azuread/issues/1017
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5.1"
    }
    mongodbatlas = {
      source      = "mongodb/mongodbatlas"
      version     = "~> 1.8.2"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.19.0"
    }
  }
  # Terraform State Storage to Azure Storage Container
  # https://www.terraform.io/language/settings/backends/configuration
  # https://www.terraform.io/language/settings/backends/azurerm
  # Terraform 1.1 and 1.2 supported a feature-flag to allow enabling/disabling the use of Microsoft Graph (and MSAL) rather than Azure Active Directory Graph (and ADAL)
  # - however this flag has since been removed in Terraform 1.3. Microsoft Graph (and MSAL) are now enabled by default and Azure Active Directory Graph (and ADAL) can no longer be used.
  backend "azurerm" {
    #resource_group_name   = "rg-terraform-storage-dev"
    #storage_account_name  = "sttfstateEnterprisedev"
    #container_name        = "citfstatefilesdev"
    #key                   = "terraform-custom-.tfstate"
    #region                = "northeurope"
  }
}



# 1. Terraform Provider Block for AzureRM with Default Enterprise Infrastructure Subscription
# https://samcogan.com/deploying-to-multiple-azure-subscriptions-with-terraform/
provider "azurerm" {
  alias             = "manualinfra"
  subscription_id   = "00000000-0000-0000-0000-000000000000" # Enterprise Infrastructure Subscription
  #region            = "northeurope"
  features {
    resource_group {
      prevent_deletion_if_contains_resources = true
      # When enabled, this feature is intended to avoid the unintentional destruction of nested Resources provisioned through some
      # other means (for example, an ARM Template Deployment) - as such you must either remove these Resources, or
      # disable this behaviour using the feature flag `prevent_deletion_if_contains_resources` within the `features`
      # block when configuring the Provider.
      # When that feature flag is set, Terraform will skip checking for any Resources within the Resource Group and
      # delete this using the Azure API directly (which will clear up any nested resources).
      # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#features
    }
  }
}



# 2. Terraform Provider Block for AzureRM - North Europe
provider "azurerm" {
  alias           = "europe"
  subscription_id = var.azure_subscription_europe
  #region = "northeurope"
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = false
      # When enabled, this feature is intended to avoid the unintentional destruction of nested Resources provisioned through some
      # other means (for example, an ARM Template Deployment) - as such you must either remove these Resources, or
      # disable this behaviour using the feature flag `prevent_deletion_if_contains_resources` within the `features`
      # block when configuring the Provider.
      # When that feature flag is set, Terraform will skip checking for any Resources within the Resource Group and
      # delete this using the Azure API directly (which will clear up any nested resources).
      # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#features
    }
  }
}


# 3. Terraform Provider Block for AzureRM - Central US
provider "azurerm" {
  alias           = "us"
  subscription_id = var.azure_subscription_unitedstates
  #region = "centralus"
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = false
      # When enabled, this feature is intended to avoid the unintentional destruction of nested Resources provisioned through some
      # other means (for example, an ARM Template Deployment) - as such you must either remove these Resources, or
      # disable this behaviour using the feature flag `prevent_deletion_if_contains_resources` within the `features`
      # block when configuring the Provider.
      # When that feature flag is set, Terraform will skip checking for any Resources within the Resource Group and
      # delete this using the Azure API directly (which will clear up any nested resources).
      # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#features
    }
  }
}

provider "mongodbatlas" {
  alias       = "europe"
  #region      = "EUROPE_NORTH"
  public_key  = var.secret_mongodb_atlas_public_key
  private_key = var.secret_mongodb_atlas_private_key
}

provider "mongodbatlas" {
  alias       = "us"
  #region      = "US_CENTRAL"
  public_key  = var.secret_mongodb_atlas_public_key
  private_key = var.secret_mongodb_atlas_private_key
}

# 3. Terraform Provider Block for AzureAD
provider "azuread" {
  # NOTE: Environment Variables can also be used for Service Principal authentication
  # Terraform also supports authenticating via the Azure CLI too.
  # See official docs for more info: https://registry.terraform.io/providers/hashicorp/azuread/latest/docs
  # client_id     = "..."
  # client_secret = "..."
  # tenant_id     = "..."
  tenant_id       = var.aad_tenant_id
}

# https://github.com/hashicorp/terraform-provider-kubernetes/tree/main/_examples/aks
# https://kubernetes.io/docs/tasks/administer-cluster/certificates/
provider "kubernetes" {
  alias                  = "europe"
  host                     = local.deploy_Europe ? var.secret_aks_kube_config_host_europe : null
  client_certificate       = local.deploy_Europe ? base64decode(var.secret_aks_kube_config_client_certificate_europe) : null
  client_key               = local.deploy_Europe ? base64decode(var.secret_aks_kube_config_client_key_europe) : null
  cluster_ca_certificate   = local.deploy_Europe ? base64decode(var.secret_aks_kube_config_cluster_ca_certificate_europe) : null
}

provider "kubernetes" {
  alias                  = "us"
  host                     = local.deploy_United_States ? var.secret_aks_kube_config_host_unitedstates : null
  client_certificate       = local.deploy_United_States ? base64decode(var.secret_aks_kube_config_client_certificate_unitedstates) : null
  client_key               = local.deploy_United_States ? base64decode(var.secret_aks_kube_config_client_key_unitedstates) : null
  cluster_ca_certificate   = local.deploy_United_States ? base64decode(var.secret_aks_kube_config_cluster_ca_certificate_unitedstates) : null
}

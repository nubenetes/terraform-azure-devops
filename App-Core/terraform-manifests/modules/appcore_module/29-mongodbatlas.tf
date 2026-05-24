##############################
# MONGODB PROJECT
##############################

resource "mongodbatlas_project" "project" {
  name              = "${var.Enterprise_product}-${local.instance_environment}"
  org_id            = var.mongodb_atlas_org_id
  #project_owner_id  = "cloud-admin@example.com"  # not valid since an email addr is not a valid ID
    # Optional) Unique 24-hexadecimal digit string that identifies the Atlas user account to be granted the Project Owner role on the specified project.
    # If you set this parameter, it overrides the default value of the oldest Organization Owner.

  # teams {
  #   team_id    = "000000000000000000000000"
  #   role_names = ["GROUP_OWNER"]

  # }
  # teams {
  #   team_id    = "5e1dd7b4f2a30ba80a70cd4rw"
  #   role_names = ["GROUP_READ_ONLY", "GROUP_DATA_ACCESS_READ_WRITE"]
  # }

  is_collect_database_specifics_statistics_enabled = true
  is_data_explorer_enabled                         = true
  is_performance_advisor_enabled                   = true
  is_realtime_performance_panel_enabled            = true
  is_schema_advisor_enabled                        = true
}


##############################
# MONGODB IP ACCESS LIST
##############################

resource "mongodbatlas_project_ip_access_list" "ip" {
  project_id  = mongodbatlas_project.project.id
  #ip_address  = var.mongodb_atlas_ip_address
  cidr_block  = var.mongodb_atlas_cidr_block
  comment     = "IP Address for accessing the cluster"
  depends_on  = [
    mongodbatlas_project.project,
  ]
}

##############################
# MONGODB ATLAS CLUSTER
##############################

resource "mongodbatlas_cluster" "cluster" {
  name                   = "${var.Enterprise_product}-${local.instance_environment}"  # Atlas truncates cluster names to 23 characters
  project_id             = mongodbatlas_project.project.id
  mongo_db_major_version = var.mongodb_atlas_mongodbversion
  cluster_type           = "REPLICASET"
  cloud_backup           = true # (Optional) Flag indicating if the cluster uses Cloud Backup for backups.
  #pit_enabled            = true #  (Optional) - Flag that indicates if the cluster uses Continuous Cloud Backup. If set to true, cloud_backup must also be set to true.
    # pit_enabled = Continuous Cloud Backup: This additional option also records the full oplog for a configured window, permitting a restore to any point in time within that window.
    # Meets recovery point objective (RPO) of 1 minute. https://www.mongodb.com/docs/atlas/backup/cloud-backup/overview/#continuous-cloud-backups
  replication_specs {
    num_shards = 1
    regions_config {
      region_name     = var.mongodb_atlas_region
      electable_nodes = 3
      priority        = 7
      read_only_nodes = 0
    }
  }
  advanced_configuration {
      oplog_size_mb   = var.oplog_size_mb
  }
  # Provider Settings "block"
  #cloud_backup                 = false #true
  #auto_scaling_disk_gb_enabled = true
  provider_name               = var.mongodb_atlas_cloud_provider
  provider_instance_size_name = "M10"
  depends_on = [
    mongodbatlas_project.project,
    mongodbatlas_project_ip_access_list.ip,
    mongodbatlas_database_user.admin,
  ]
}


# resource "null_resource" "mongodb_instance_per_client" {
#   #for_each    = toset(var.client_names)
#   provisioner "local-exec" {
#     ################################################################################
#     # Creation-time provisioner:
#     # https://k21academy.com/terraform-iac/terraform-provisioners/
#     # https://www.terraform.io/language/resources/provisioners/connection
#     # https://www.terraform.io/language/resources/provisioners/null_resource
#     ################################################################################
#     #command     = "chmod +x creation-time-provisioner-mongodb.sh; ./creation-time-provisioner-mongodb.sh ${mongodbatlas_cluster.cluster.connection_strings[0].standard_srv} modb-${var.Enterprise_product}-${each.value} ${var.mongodb_atlas_dbadmin} ${var.secret_mongodb_atlas_dbadmin_password} ${var.environment}"
#     command     = "chmod +x creation-time-provisioner-mongodb.sh; ./creation-time-provisioner-mongodb.sh ${mongodbatlas_cluster.cluster.connection_strings[0].standard_srv} modb-${var.Enterprise_product}-${each.value} ${var.mongodb_atlas_dbadmin} ${var.secret_mongodb_atlas_dbadmin_password} ${var.environment}"
#   }
#   depends_on = [
#     mongodbatlas_project.project,
#     mongodbatlas_project_ip_access_list.ip,
#     mongodbatlas_database_user.admin,
#     mongodbatlas_cluster.cluster,
#   ]

# }


####################################################################################################################################
# https://www.hashicorp.com/blog/terraform-1-4-improves-the-cli-experience-for-terraform-cloud
# https://developer.hashicorp.com/terraform/language/resources/terraform-data
# Terraform 1.4 introduces a new terraform_data resource as a built-in replacement for the null resource.
# This removes the need to include the null provider in your configuration and supports all the same capabilities as null_resource
####################################################################################################################################
resource "terraform_data" "mongodb_instance_per_client" {
  for_each     = toset(var.client_names)
  provisioner "local-exec" {
    ################################################################################
    # Creation-time provisioner:
    # https://k21academy.com/terraform-iac/terraform-provisioners/
    # https://www.terraform.io/language/resources/provisioners/connection
    # https://www.terraform.io/language/resources/provisioners/null_resource
    ################################################################################
    #command     = "chmod +x creation-time-provisioner-mongodb.sh; ./creation-time-provisioner-mongodb.sh ${mongodbatlas_cluster.cluster[0].connection_strings[0].standard_srv} modb-${var.Enterprise_product}-${each.value} ${var.mongodb_atlas_dbadmin} ${var.secret_mongodb_atlas_dbadmin_password} ${var.environment}"
    command     = "chmod +x creation-time-provisioner-mongodb.sh; ./creation-time-provisioner-mongodb.sh ${mongodbatlas_cluster.cluster.connection_strings[0].standard_srv} modb-${var.Enterprise_product}-${each.value} ${var.mongodb_atlas_dbadmin} ${var.secret_mongodb_atlas_dbadmin_password} ${var.environment}"
  }
  depends_on = [
    mongodbatlas_project.project,
    mongodbatlas_project_ip_access_list.ip,
    mongodbatlas_database_user.admin,
    mongodbatlas_cluster.cluster,
  ]

}


#############################
# MONGODB USERS
##############################

# DATABASE ADMIN USER  [Configure Database Users](https://docs.atlas.mongodb.com/security-add-mongodb-users/)
# https://www.mongodb.com/docs/atlas/reference/api/database-users-get-single-user/
# The admin database accepts these values for the role parameter:
# atlasAdmin
# readWriteAnyDatabase
# readAnyDatabase
# clusterMonitor
# backup
# dbAdminAnyDatabase
# enableSharding
resource "mongodbatlas_database_user" "admin" {
  project_id         = mongodbatlas_project.project.id
  username           = var.mongodb_atlas_dbadmin
  password           = var.secret_mongodb_atlas_dbadmin_password #var.secret_mongodb_atlas_dbuser_password
  auth_database_name = "admin"

  roles {
    role_name    = "dbAdminAnyDatabase"
    database_name = "admin" # The database name and collection name need not exist in the cluster before creating the user.
  }
  roles {
    role_name    = "readWriteAnyDatabase"
    database_name = "admin" # The database name and collection name need not exist in the cluster before creating the user.
  }
  labels {
    key   = "Name"
    value = "AppAnalysis DB Admin"
  }
  # scopes {
  #   name = mongodbatlas_cluster.cluster.name
  #   type = "CLUSTER"
  # }
  # depends_on = [
  #   mongodbatlas_cluster.cluster,
  # ]
}


# DATABASE USER  [Configure Database Users](https://docs.atlas.mongodb.com/security-add-mongodb-users/)
# https://www.mongodb.com/docs/atlas/reference/api/database-users-get-single-user/
# The admin database accepts these values for the role parameter:
# atlasAdmin
# readWriteAnyDatabase
# readAnyDatabase
# clusterMonitor
# backup
# dbAdminAnyDatabase
# enableSharding
resource "mongodbatlas_database_user" "user" {
  project_id         = mongodbatlas_project.project.id
  username           = var.mongodb_atlas_dbuser
  password           = var.secret_mongodb_atlas_dbuser_password
  auth_database_name = "admin"

  roles {
    role_name    = "readWriteAnyDatabase"
    database_name = "admin" # The database name and collection name need not exist in the cluster before creating the user.
  }

  labels {
    key   = "Name"
    value = "AppAnalysis DB User"
  }
  # scopes {
  #   name = mongodbatlas_cluster.cluster.name
  #   type = "CLUSTER"
  # }
}

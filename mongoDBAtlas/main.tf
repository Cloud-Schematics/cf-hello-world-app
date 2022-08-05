
resource "mongodbatlas_project" "project" {
  name   = var.mongodbatlas_project_name
  org_id = var.mongodbatlas_org_id
}

resource "mongodbatlas_cluster" "mongodb" {
  project_id                  = mongodbatlas_project.project.id
  name                        = var.mongodb_instance_name
  cluster_type                = "REPLICASET"
  provider_name               = "TENANT"
  backing_provider_name       = var.backing_provider_name
  provider_region_name        = var.provider_region_name
  provider_instance_size_name = "M0"
}

resource "mongodbatlas_project_ip_access_list" "test" {
  project_id = mongodbatlas_project.project.id
  cidr_block = var.mongodb_ip_access_cidr_block
  comment    = "ip address for tf acc testing"
}

resource "mongodbatlas_database_user" "test" {
  username           = var.db_username
  password           = var.db_password
  project_id         = mongodbatlas_project.project.id
  auth_database_name = var.auth_database_name
  dynamic "roles" {
    for_each = var.roles
    content {
      role_name     = roles.value["role_name"]
      database_name = roles.value["database_name"]
    }
  }
}

locals {
  split_standard_srv = split("//", mongodbatlas_cluster.mongodb.connection_strings[0].standard_srv)
  connection_string  = format("%s:%s@%s", mongodbatlas_database_user.test.username, mongodbatlas_database_user.test.password, local.split_standard_srv[1])

}

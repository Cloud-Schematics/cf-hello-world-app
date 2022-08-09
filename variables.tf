# Provider block variables
variable "mongodbatlas_public_key" {
  type        = string
  description = "Public key of your MongoDB Atlas API key pair"
}
variable "mongodbatlas_private_key" {
  type        = string
  description = "Private key of your MongoDB Atlas key pair."
}

# mongodbatlas_project variables
variable "mongodbatlas_project_name" {
  type        = string
  description = "The name of the project you want to create. "
  default = "demo-project"
}
variable "mongodbatlas_org_id" {
  description = "The ID of the organization you want to create the project within."
  type        = string
}

# mongodbatlas_cluster variables
variable "mongodb_instance_name" {
  type        = string
  description = "Name of the cluster as it appears in Atlas."
  default = "demo-project"
}
variable "backing_provider_name" {
  type        = string
  description = "Cloud service provider on which the server for a multi-tenant cluster is provisioned."
  default     = "GCP"

}
variable "provider_region_name" {
  type        = string
  description = "Physical location of your MongoDB cluster."
  default     = "CENTRAL_US"
}

# mongodbatlas_project_ip_access_list variables
variable "mongodb_ip_access_cidr_block" {
  type        = string
  description = "Range of IP addresses in CIDR notation to be added to the access list"
  default     = "0.0.0.0/0"
}

# mongodbatlas_database_user variables
variable "db_username" {
  type        = string
  description = "Username for authenticating to MongoDB"
}
variable "db_password" {
  type        = string
  sensitive   = true
  description = "User's initial password."
}
variable "auth_database_name" {
  type        = string
  description = "Database against which Atlas authenticates the user."
  default     = "admin"

}
variable "roles" {
  description = "List of user's roles and the databases / collections on which the roles apply."
  default = [
    {
      role_name     = "atlasAdmin"
      database_name = "admin"
    }
  ]
}

########## __________ V A R I A B L E S __________ ##########

variable "ibm_cloud_api_key" {
  description = "specify your IBM Cloud APIKey"
}

variable "ibm_cloud_id" {
  description = "specify your IBM Cloud ID/EmailID"
}

variable "ibm_cloud_space" {
  description = "specify your IBM Cloud space name"
  default     = "dev"
}

variable "ibm_cloud_region" {
  description = "specify the region to deploy the app"
  default     = "eu-gb"
}


variable "application_hostname" {
  description = "specify the hostname for the application's route. The specified hostname will then be extended by region shared domain"
}

variable "application_version" {
  description = "specify the version of the application. A change of this parameters is an indication for terraform that the application code has changed and needs redeployment."
  default     = "1"
}

variable "application_instances" {
  description = "specify the number of cloud foundry application instances to be deployed"
  default     = "1"
}
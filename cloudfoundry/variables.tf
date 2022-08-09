########## __________ V A R I A B L E S __________ ##########

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

variable "mongodbatlas_url" {
  description = "specify the connection string url to connect to mongodbatlas"
}
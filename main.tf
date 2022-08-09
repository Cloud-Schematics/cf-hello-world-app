module "mongodb" {
    source = "./mongoDBAtlas"
    mongodbatlas_org_id = var.mongodbatlas_org_id
    mongodbatlas_project_name = var.mongodbatlas_project_name
    mongodb_instance_name = var.mongodb_instance_name
    backing_provider_name= var.backing_provider_name
    provider_region_name= var.provider_region_name
    mongodb_ip_access_cidr_block = var.mongodb_ip_access_cidr_block
    db_username = var.db_username
    db_password = var.db_password
    auth_database_name = var.auth_database_name
}


module "cloudfoundry" {
    source = "./cloudfoundry"
    ibm_cloud_id = var.ibm_cloud_id
    ibm_cloud_space = var.ibm_cloud_space
    ibm_cloud_region = var.ibm_cloud_region
    application_hostname = var.application_hostname
    application_version = var.application_version
    application_instances = var.application_instances
    mongodbatlas_url = module.mongodb.connection_strings
    
}
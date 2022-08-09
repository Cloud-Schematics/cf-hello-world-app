# Configure the IBM Cloud Provider
provider "ibm" {
  region = var.ibm_cloud_region
  ibm_cloud_api_key = var.ibm_cloud_api_key
}
provider "mongodbatlas" {
  public_key  = var.mongodbatlas_public_key
  private_key = var.mongodbatlas_private_key
}

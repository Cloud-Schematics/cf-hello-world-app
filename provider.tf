# Configure the IBM Cloud Provider
provider "ibm" {
  region = var.ibm_cloud_region
}
provider "mongodbatlas" {
  public_key  = var.mongodbatlas_public_key
  private_key = var.mongodbatlas_private_key
}

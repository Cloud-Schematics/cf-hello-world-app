########## __________ M A I N __________ ##########
resource "ibm_org" "myorg" {
  name = "demo-${var.ibm_cloud_id}"
}


resource "ibm_space" "myspace" {
  org        = resource.ibm_org.myorg.name
  name       = var.ibm_cloud_space
  managers   = [var.ibm_cloud_id]
  developers = [var.ibm_cloud_id]
}


resource "random_id" "server" {
  keepers = {
    # Generate a new id each time we switch to a new AMI id
    application_hostname = var.application_hostname
  }

  byte_length = 8
}

# Create an Cloud Froundry application 
resource "ibm_app" "cfapp" {
  name              = "cfnode-${var.application_hostname}"
  space_guid        = resource.ibm_space.myspace.id
  wait_time_minutes = 10
  buildpack         = "nodejs_buildpack"
  app_path          = "${path.module}/appcode/HelloWorld.zip"
  app_version       = var.application_version
  route_guid        = ["${ibm_app_route.myroute.id}"]
  instances         = var.application_instances
  environment_json = {
    "ATLAS_URI" = var.mongodbatlas_url
  }
}


data "ibm_app_domain_shared" "mydomain" {
  name = "${var.ibm_cloud_region}.cf.appdomain.cloud"
}

resource "ibm_app_route" "myroute" {
  domain_guid = data.ibm_app_domain_shared.mydomain.id
  space_guid  = resource.ibm_space.myspace.id
  host        = "${var.application_hostname}-${random_id.server.hex}"
}




########## __________ O U T P U T S __________ ##########

output "final_output" {
  value = "Access the application at https://${var.application_hostname}-${random_id.server.hex}.${data.ibm_app_domain_shared.mydomain.name}"
}

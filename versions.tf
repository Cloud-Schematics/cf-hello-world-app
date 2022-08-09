terraform {
  required_providers {
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "1.4.3"
    }
    ibm = {
      source = "IBM-Cloud/ibm"
      version = "1.43.0"
    }
  }
}

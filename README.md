# cf-hello-world-app
## Pre-requisites to work with MongoDBAtlas Template:
1. Signup to [MongoDB Atlass](https://www.mongodb.com/cloud)
2. Create an organisation.[here](https://cloud.mongodb.com/v2#/preferences/organizations/create)
3. Go to `org settings`(Org Settings Icon next to the top left) --> `Access Manager` --> `Create Api Key` (Find `Create Api Key` tab on top right corner) --> Select `Organization  Owner` from Organization Permissions drop-down.
4. You will get `public` and `private key` pair once you create an API Key. These two keys are used for MongoDB Atlas provider authentication.
5. Signup for [IBM Cloud](https://cloud.ibm.com)
6. Create an IBM Cloud API Key.[here](https://cloud.ibm.com/iam/apikeys)


### Overview of the template:

This template creates following:
1. A project under Atlas Org
2. MongoDb Cluster in the project
3. Access list and database users to the MongoDb Cluster
4. Cloud Foundry organisation and space
5. Deploys sample HelloWorld App with MongoDb Cluster as backend

### Inputs of MongoDB Atlas Template:
|Variable|Type|Description|Default|
|-----|-----|-----|----|
| mongodbatlas_public_key  |string|Public key of your MongoDB Atlas API key pair |NA|
| mongodbatlas_private_key |string|Private key of your MongoDB Atlas key pair.|NA|
| mongodbatlas_project_name|string|The name of the project you want to create. |demo-project|
| mongodbatlas_org_id      |string|The ID of the organization you want to create the project within.|NA|
| mongodb_instance_name    |string|Name of the cluster as it appears in Atlas.|demo-project|
| backing_provider_name    |string|Cloud service provider on which the server for a multi-tenant cluster is provisioned.|`GCP`|
| provider_region_name       |string|Physical location of your MongoDB cluster.|`CENTRAL_US`|
| mongodb_ip_access_cidr_block    |string|Range of IP addresses in CIDR notation to be added to the access list|`"0.0.0.0/0"`|
| db_username              |string|Username for authenticating to MongoDB|NA|
| db_password              |string|User's initial password.|NA|
| auth_database_name              |string|Database against which Atlas authenticates the user.|`admin`|
| roles              |list(object)|List of user's roles and the databases / collections on which the roles apply.|{ role_name = "atlasAdmin" database_name = "admin" }|
| ibm_cloud_api_key|string|The IBM Cloud API Key|NA|
| ibm_cloud_id|string|The IBMID/EmailID associated with your IBM Cloud|NA|
| ibm_cloud_space|string|The name for CloudFoundry space|dev|
| ibm_cloud_region|string|The IBM Cloud region where the app is deployed|eu-gb|
| application_hostname|string|hostname for the application's route. The specified hostname will then be extended by randonstring and region shared domain||
| application_version|string|The version of the application. A change of this parameters is an indication for terraform that the application code has changed and needs redeployment|1|
| application_instances|string|The number of cloud foundry application instances to be deployed|1|

### Outputs of Application hosted url
|Name|Description|Sensitive|
|-----|----------|---------|
|application_url|The route for accessing the application |false|

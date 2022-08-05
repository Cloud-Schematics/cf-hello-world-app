# cf-hello-world-app
## Pre-requisites to work with MongoDBAtlas Template:
1. Signup to [MongoDB Atlass](https://www.mongodb.com/cloud)
2. Create an organisation.[here](https://cloud.mongodb.com/v2#/preferences/organizations/create)
3. Go to `org settings`(Org Settings Icon next to the top left) --> `Access Manager` --> `Create Api Key` (Find `Create Api Key` tab on top right corner)
4. You will get `public` and `private key` pair once you create an API Key. These two keys are used for MongoDB Atlas provider authentication.


### Overview of MongoDB Atlas Template:

This template creates following:
1. A project under Atlas Org
2. MongoDb Cluster in the project
3. Access list and database users to the MongoDb Cluster
### Inputs of MongoDB Atlas Template:
|Variable|Type|Description|Default|
|-----|-----|-----|----|
| mongodbatlas_public_key  |string|Public key of your MongoDB Atlas API key pair |NA|
| mongodbatlas_private_key |string|Private key of your MongoDB Atlas key pair.|NA|
| mongodbatlas_project_name|string|The name of the project you want to create. |NA|
| mongodbatlas_org_id      |string|The ID of the organization you want to create the project within.|NA|
| mongodb_instance_name    |string|Name of the cluster as it appears in Atlas.|NA|
| backing_provider_name    |string|Cloud service provider on which the server for a multi-tenant cluster is provisioned.|`GCP`|
| provider_region_name       |string|Physical location of your MongoDB cluster.|`CENTRAL_US`|
| mongodb_ip_access_cidr_block    |string|Range of IP addresses in CIDR notation to be added to the access list|`"0.0.0.0/0"`|
| db_username              |string|Username for authenticating to MongoDB|NA|
| db_password              |string|User's initial password.|NA|
| auth_database_name              |string|Database against which Atlas authenticates the user.|`admin`|
| roles              |list(object)|List of user's roles and the databases / collections on which the roles apply.|{ role_name = "atlasAdmin" database_name = "admin" }|

### Outputs of MongoDB Atlas Template:
|Name|Description|Sensitive|
|-----|----------|---------|
|connection_strings|Public mongodb+srv:// connection string for this cluster|true|

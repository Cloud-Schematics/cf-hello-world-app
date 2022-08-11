# Deploying Cloud Foundry using MongoDB cloud services

In this hands on lab, you will use the Terraform template that creates the following:
1. A project in [Mongodb Atlas](https://www.mongodb.com/docs/atlas/getting-started/) organisation.
2. [MongoDb cluster](https://www.mongodb.com/docs/atlas/tutorial/deploy-free-tier-cluster/) in the project.
3. Access list and database users to the MongoDb cluster.
4. [Cloud Foundry](https://cloud.ibm.com/docs/cloud-foundry-public?topic=cloud-foundry-public-getting-started) organisation and space.
5. Deploys sample `HelloWorld App` with MongoDb cluster as backend.

This Terraform sample allows you to deploy a Cloud Foundry app either using Terraform or Schematics on IBM Cloud. You can also learn to use a Terraform template of Cloud Foundry app and deploy by using the Schematics workspace. As part of this lab, you will use `ibm_app` for Cloud Foundry resource, `mongodbatlas_cluster` for MongoDB resource, and other dependency resources in the Terraform template.
{: shortdesc}

## Prerequisites

Before you begin, make sure that you setup the MongoDBAtlas:
1. Signup to [MongoDB Atlass](https://www.mongodb.com/cloud)
    - Click **Try Free**.
    - Provide your name, organization, email ID, password, and Check the privacy acceptance.
    - Access your email, to verify the MongoDB account verification is complete.
    - Click **Continue** to view the MongoDB welcome page followed with the following database usage plan page.
      ![Mongodb create page](/images/mongodbcreate.png)
2. Create an organisation. 
    - Click [MongoDB create organization](https://cloud.mongodb.com/v2#/preferences/organizations/create) for more detail.
    - Click **Create an organisation**.
    - Enter **Name Your Organization** as `ibm-testorg`.
    - Click **Next**.
    - Click **Create Organization**.
    - Click **Access Manager** from the left navigation panel.
    - Click **Create API Key**.
    - Name **Description** as `ibm-testorgkeys`.
    - Ensure **Organization Permission** is checked as `Organization Owner`.
    - Click **Next** to view the Public Key and Private Key of your organization. 
    - Click **Settings** to view the Organization ID.
      **Note** Make a note of the Organization ID, public and private keys. These inputs value are used for MongoDB Atlas provider.
    - Click **Done**.
3. Signup from the [IBM Cloud console](https://cloud.ibm.com) with a valid IBM ID. For more information about the sign up process, see [IBM Cloud login](https://cloud.ibm.com/docs/account?topic=account-login-sequence).
4. Create an [IBM Cloud API Key](https://cloud.ibm.com/iam/apikeys). For more information, about steps to create the API keys, see [Creating an API key](https://cloud.ibm.com/docs/account?topic=account-userapikey&interface=ui#create_user_key). 

   **Note** Record your IBM Cloud email ID, and IBM Cloud API Key for the template input.

## Creating Schematics workspace

Use the IBM Cloud Schematics to build and spin up your IBM Cloud environment, automate cloud resource operations, install software, and run multitiered apps on your cloud resources. For more information, refer to, [IBM Cloud Schematics](https://cloud.ibm.com/docs/schematics). Follow the steps to use Schematics workspace to provision and deploying your app by using the resources.

1. Log in to your [IBM Cloud](https://cloud.ibm.com/workspaces) account by using your credentials.
2. Click [**Create workspace +**](https://cloud.ibm.com/schematics/workspaces/create).
    - In **Specify Template** section:
        - **GitHub, GitLab or Bitbucket repository URL** - `https://github.com/Cloud-Schematics/cf-hello-world-app`.
        - **Personal access token** - `<Leave it blank>`.
        - Terraform Version - `terraform_v1.0`. **Note** you need to select Terraform verion 1.0 or greater version.
        - Click `Next`.
    - In **Workspace details** section:
        - **Workspace name** as `deploying mongodb template in schematics`.
        - **Tags** - `<leave it blank>`.
        - **Resource group** as `default` or other resource group for this Workspace. 
        - **Location** as `North America` or other [region](/docs/schematics?topic=schematics-multi-region-deployment) for this workspace.
        - Click `Next`.
        - Check the information entered are correct to create a workspace.
    - Click `Create`.
3. On successful creation of `deploying mongodb template in schematics` workspace, as shown in the screen capture. 
   ![create workspace success](/images/createworkspacesuccess.png)
4. Click **Settings** to edit the following input variables in the workspace. 
    | Name | Value |
    | -- | -- |
    | `mongodbatlas_public_key` | Provide the recorded Mongodb public key. |
    | `mongodbatlas_private_key` | Provide the recorded Mongodb private key. |
    | `mongodbatlas_org_id` | The ID of the organization you want to create the project within. For example `ibm`.|
    | `ibm_cloud_api_key` | Specify your IBM Cloud API key. |
    | `ibm_cloud_id` | Specify your IBM Cloud ID or email ID. |
    | `db_username` | Provide your database username, for example, `testAdmin`.|
    | `db_password` | Provide your database password, for example, `test123$$$`.|
    | `application_hostname` | Provide the Cloud Foundry application hostname. for example, `test-cfhelloworld-app`.|

    For more information, about the input variable, refer to, [Readme](https://github.com/Cloud-Schematics/cf-hello-world-app/blob/main/README.md) file.
5. Click **Generate plan** workspace to validate the input variables for the resource and view the success page.
   ![Generate plan success](/images/generateplansucccess.png)
6. Click **Apply plan** workspace to provision the resource. Wait 1 - 2 minutes to complete the job execution and view the success page.
7. Expand **Apply plan successful** logs > **show more** to view the URL created as shown in the screen capture.
   ![Application output url](/images/outputurl.png)
8. Access the URL in the browser to use the deployed application. For example `https://test-b00061797d347d36.eu-gb.cf.appdomain.cloud`
9. Enter the string `Hello world` or `your name` and click `Enter` to view the data in stored in the database content.
   ![Access app](/images/accessapp.png)
10. Optional: You can verify the `demo-project` is created in your MongoDB organizationas through Schematics 
    - Log in to [Cloud MongoDB](https://cloud.mongodb.com) with your credentials.
    - From the left corner select your organization, for example `ibm-testorg` to view the created `demo-project` as shown in the screen capture.
       ![demo project creation](/images/demo-project.png)
    - Click **Network Access** to view the configured IP address from the Schematics workspace.
       ![network access config](/images/networkaccess.png)
    - Click **Database Access** to view the configured DB user from the Schematics workspace.
       ![databaseaccess config](/images/databaseaccess.png)
11. Optional: You can verify in IBM Cloud account the Cloud Foundry instance is created by
    - Click **Resource list** > **Cloud Foundry** > **Public** to view `test-cfhelloworld-app` application is deployed.
 
## What's next

- You can learn to deploy additional Schematics related workspace using [Getting started: IBM Cloud Schematics](https://cloud.ibm.com/docs/schematics?topic=schematics-getting-started).
- For any FAQs, refer to, [Schematics FAQs](https://cloud.ibm.com/docs/schematics?topic=schematics-workspaces-faq).
- For help and support, click [Getting help and support](https://cloud.ibm.com/docs/schematics?topic=schematics-schematics-help).

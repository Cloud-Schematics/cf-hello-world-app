# Deploying Cloud Foundry using MongoDB cloud services

In this hands on lab, you will use the Terraform template that creates the following:
1. A project under Atlas Organisation
2. MongoDb Cluster in the project
3. Access list and database users to the MongoDb Cluster
4. Cloud Foundry organisation and space
5. Deploys sample HelloWorld App with MongoDb Cluster as backend

This Terraform sample allows you to deploy a Cloud Foundry app either using Terraform or Schematics on IBM Cloud. You can also learn to use a Terraform template of Cloud Foundry app and deploy by using the {{site.data.keyword.bpshort}} workspace. As part of the tutorial, you will use `ibm_org` and `ibm_space` Cloud Foundry resources and `mongodbatlas_cluster`, `mongodbatlas_project_ip_access_list` MongoDB resources in the Terraform template.
{: shortdesc}

The resources used in this template are from the Lite plan, where the cost is not incurred.
{: important}

## Prerequisites

Before you begin, make sure that you setup the MongoDBAtlas
1. Signup to [MongoDB Atlass](https://www.mongodb.com/cloud)
    - Click **Try Free**.
    - Provide your name, organization, email ID, password, and Check the privacy acceptance.
    - Access your email, to verify the MongoDB successful verification.
    - Click **Continue** to view the MongoDB welcome page followed with the following database usage plan page.
      ![Mongodb create page](../images/mongodbcreate.png){: caption=" " caption-side="center"}
2. Create an organisation. 
    - Click [MongoDB create organization](https://cloud.mongodb.com/v2#/preferences/organizations/create).
    - Click **Create an organisation**.
    - Enter **Name Your Organization** as `ibm-testorg`.
    - Click **Next**.
    - Click **Create Organization**.
    - Click **Access Manager** from the left navigation panel.
    - Click **Create API Key**.
    - Name **Description** as `ibm-testorgkeys`.
    - Click **Next** to view the Public Key and Private Key of your organization. 
      Make a note of the public and private keys. These two keys are used for MongoDB Atlas provider authentication.
      {: note}
    
    - Click **Done**.
3. Signup from the [IBM Cloud console](https://cloud.ibm.com) with a valid IBM ID. For more information about the sign up process, see [IBM Cloud login](https://cloud.ibm.com/docs/account?topic=account-login-sequence).
4. Create an [IBM Cloud API Key](https://cloud.ibm.com/iam/apikeys). For more information, about steps to create the API keys, see [Creating an API key](https://cloud.ibm.com/docs/account?topic=account-userapikey&interface=ui#create_user_key).

## Creating workspace using Mongodb and Cloud Foundry Terraform template 
{: #mongodb-templates}

1. Log in to your [{{site.data.keyword.cloud_notm}}](https://cloud.ibm.com/workspaces){: external} account by using your credentials.
2. Click [**Create workspace +**](https://cloud.ibm.com/schematics/workspaces/create){: external}.
    - In **Specify Template** section:
        - **GitHub, GitLab or Bitbucket repository URL** - `https://github.com/Cloud-Schematics/cf-hello-world-app/tree/mongoDBAtlas`.
        - **Personal access token** - `<Provide your Git personal access token if the repository is private>`.
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
3. On successful creation of `deploying mongodb template in schematics` workspace. 
4. Click **Settings** to edit the following input variables in the workspace. 
    | Name | Value |
    | -- | -- |
    | mongodbatlas_public_key | Provide the recorded Mongodb public key. |
    | mongodbatlas_private_key | Provide the recorded Mongodb private key. |
    | mongodbatlas_org_id | The ID of the organization you want to create the project within. For example `ibm`.|
    | ibm_cloud_api_key | Specify your IBM Cloud API key. |
    | ibm_cloud_id | Specify your IBM Cloud ID or email ID. |
    | db_username | Provide your database username, for example, `atlasAdmin`.|
    | db_password | Provide your database password.|
    | application_hostname | Provide the application hostname. Access MongoDB Atlas > Get all cluster > cluster0 > copy the primary hostname and port number, for example, `test`.|

    For more information, about the input variable, refer to, [Readme](https://github.com/Cloud-Schematics/cf-hello-world-app/blob/main/README.md){: external} file.
5. Click **Generate plan** workspace to validate the input variables for the resource and view the success page.
   ![Generate plan success](../images/generateplansuccess.png)
6. Click **Apply plan** workspace to provision the resource. Wait 1 - 2 minutes to complete the job execution and view the success page.
   ![Apply plan success](../images/applyplansuccess.png)

## Verify your deployment

Verify that the `demo-project` is created in your MongoDB organisationas through Schematics 
- Log in to [Cloud MongoDB](https://cloud.mongodb.com) with your credentials.
- From the left corner select your organization, for example `ibm-testorg` to view the created `demo-project` as shown in the screen capture.
   ![demo project creation](../images/demo-project.png)
- Click **Network Access** to view the configured IP address from the Schematics workspace.
   ![network access confg](../images/networkaccess.png)
- Click **Database Access** to view the configured DB user from the Schematics workspace.
   ![network access confg](../images/databaseaccess.png)

Now, you can connect your `Node.js` application and deploy in your `demo-project`.

- Select your **demo-project** > **databases** > **Connect** > **Connect your application**.
- Add your connection string in your application code and start updating the data into your project.

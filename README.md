## Azure Terraform CI/CD Pipeline <br>
# Prerequisites<br>

1. Create account on terraform cloud
 - https://app.terraform.io/
2. Create github account
 - https://github.com/
3. Create organisation, workspace in Terraform cloud and integrate to GITHUB (VCS)
 - https://developer.hashicorp.com/terraform/tutorials/cloud-get-started/cloud-sign-up#create-an-account 
 - https://developer.hashicorp.com/terraform/tutorials/cloud-get-started/cloud-workspace-create
 - https://developer.hashicorp.com/terraform/tutorials/cloud-get-started/cloud-vcs-change#enable-vcs-integration
4. Create service principal credential in Azure with required role 
 - https://learn.microsoft.com/en-us/cli/azure/ad/sp?view=azure-cli-latest#az-ad-sp-create
5. Create Azure blob storage container for terraform backend
 - https://learn.microsoft.com/en-us/azure/storage/blobs/blob-containers-portal
   Include details from blob storage container in main.tf for backend configuration
6. Set the follwoing env variable in terraform cloud:<br>
   `ARM_ACCESS_KEY` - Storage key (`az storage account keys list --resource-group {RG} --account-name {blobstoragerag} --query '[0].value' -o tsv`) <br>
   `ARM_CLIENT_ID` - Service principal app id <br>
   `ARM_CLIENT_SECRET` - Service principal secret <br>
   `ARM_SUBSCRIPTION_ID` - Azure subscription id <br>
   `ARM_TENANT_ID- Azure` tenant id <br>

---
All set :-) <br>
--- 

**Pushing the files to github now will run the terraform pipeline**


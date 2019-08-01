# Azure Devops Work Items REST with Powershell
This project contains some sample functions that allows you to call the REST api via powershell
Meant as a quick start to get you started rather than a complete library.


## PrivateData.ps1
This contains three functions that return strings. 

### Get-OrgURL
Function to return the ORG URL (string)
Example : https://dev.azure.com/XXXYYYZZZ

### Get-PersonalAccessToken
Function to return your PAT (string)
Documentation on how to create here. 
https://docs.microsoft.com/en-us/azure/devops/organizations/accounts/use-personal-access-tokens-to-authenticate?view=azure-devops

### Get-ProjectName
Function to return the project name.
Example : SampleShop


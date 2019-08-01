# Azure Devops Work Items REST with Powershell
This project contains some sample functions that allows you to call the REST api via powershell
Meant as a quick start to get you started rather than a complete library.

## WorkItemUtilityFunctions.ps1
Some functions to call rest API showing some of the functionality.  Complete documentation here.  
https://docs.microsoft.com/en-us/rest/api/azure/devops/wit/?view=azure-devops-server-rest-5.0  
https://docs.microsoft.com/en-us/rest/api/azure/devops/wit/work%20items/update?view=azure-devops-server-rest-5.0  

## SampleFunctionCalls.ps1
Some sample calls to the functions in WorkItemUtilityFunctions.ps1

## VisualStudioSolution File
These are not needed to run the scripts but are there to help debugging etc.

## PrivateData.ps1
This contains three functions that return strings.  Not published as part of project.  Enter data directly if you like.

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


#
# Sample functions to work with Azure Rest API for work Items
# https://docs.microsoft.com/en-us/rest/api/azure/devops/wit/?view=azure-devops-server-rest-5.0
#

#prepares header for Rest API calls
function Create-Header
{
	Param([string]$personaAccessToken)
	$token = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes(":$($personalToken)"))
	@{authorization = "Basic $token"}
}


function Get-WorkItems
{
	Param([string]$org, [string]$project, [string]$PAT, [string]$workItemIds)
	$header = Create-Header $PAT
	$url = $org + "/" + $project + "/_apis/wit/workitems?ids=" + $workItemIds + "&api-version=5.0"
	Write-Host "calling : " + $url
	Invoke-RestMethod -Uri $url -Method Get -ContentType "application/json" -Headers $header
}

function Update-WorkItemDescription
{
	#https://docs.microsoft.com/en-us/rest/api/azure/devops/wit/work%20items/update?view=azure-devops-server-rest-5.0
	param([string]$org, [string]$project, [string]$PAT, [string]$workItemId, [string]$description, [string]$historyComment)
$body = @"
[

	{
	"op": "add",
	"path": "/fields/System.Description",
	"value": "$description"
	},
	{
	"op": "add",
	"path": "/fields/System.History",
	"value": "$historyComment"
	}
]
"@
	Update-WorkItem $org $project $PAT $workItemId $body
}


function Update-WorkItem
{
	Param([string]$org, [string]$project, [string]$PAT, [string]$workItemId, [string]$body)
	#full description of all options and sample JSON Here.
	#https://docs.microsoft.com/en-us/rest/api/azure/devops/wit/work%20items/update?view=azure-devops-server-rest-5.0
	$header = Create-Header $PAT
	$url = $org + "/" + $project + "/_apis/wit/workitems/" + $workItemId + "?api-version=5.0"
	Write-Host "calling : " + $url
	Invoke-RestMethod -Uri $url -Method Patch -ContentType "application/json-patch+json" -Headers $header -Body $body
}

function Create-Bug
{
	param([string]$org, [string]$project, [string]$PAT, [string]$title, [string]$retrosteps)
$body = @"
[
  {
    "op": "add",
    "path": "/fields/System.Title",
    "from": null,
    "value": "$title"
  },
  {
    "op": "add",
    "path": "/fields/Microsoft.VSTS.TCM.ReproSteps",
    "value": "$retrosteps"
  },
  {
    "op": "add",
    "path": "/fields/System.History",
    "value": "created by powershell script"
  }
]
"@
	$header = Create-Header $PAT
	$url = $org + "/" + $project + '/_apis/wit/workitems/$Bug?api-version=5.0' #see $Bug.. to create Bug.
	Write-Host "calling : " + $url
	Invoke-RestMethod -Uri $url -Method Post -ContentType "application/json-patch+json" -Headers $header -Body $body
}
function Create-ProductBacklogItem
{
	param([string]$org, [string]$project, [string]$PAT, [string]$title, [string]$description)
$body = @"
[
  {
    "op": "add",
    "path": "/fields/System.Title",
    "from": null,
    "value": "$title"
  },
  {
    "op": "add",
    "path": "/fields/System.Description",
    "value": "$description"
  },
  {
    "op": "add",
    "path": "/fields/System.History",
    "value": "created by powershell script"
  }
]
"@
	$header = Create-Header $PAT
	$url = $org + "/" + $project + '/_apis/wit/workitems/$Product Backlog Item?api-version=5.0' #see $Product Backlog Item.. to create Bug.
	Write-Host "calling : " + $url
	Invoke-RestMethod -Uri $url -Method Post -ContentType "application/json-patch+json" -Headers $header -Body $body
}

function Write-HostWorkItemList($workItems)
{
	foreach($workItem in $workItems.value)
	{
		Write-HostWorkItem($workItem)
	}
}
function Write-HostWorkItem($workItem)
{
	Write-Host "Work Item Id : "  $workItem.id
	Write-Host "Title : " $workItem.fields.'System.Title'
	Write-Host "Description : "  $workItem.fields.'System.Description'
}
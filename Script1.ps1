#
# Script1.ps1
#
. .\PrivateData.ps1 
. .\WorkItemUtilityFunctions.ps1

$orgUrl = Get-OrgURL
$project = Get-ProjectName 
$personalToken = Get-PersonalAccessToken


$title = "Sample Product Backlog Item - mel"
$description = "<div>Time : " + [System.DateTime]::Now.ToLongDateString() + " : " + [System.DateTime]::Now.ToLongTimeString() + "</div>"
$newPBI = Create-ProductBacklogItem $orgUrl $project $personalToken $title $description
Write-HostWorkItem $newPBI

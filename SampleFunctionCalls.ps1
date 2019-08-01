#
# Sample script to demonstrate how to call the functions.
#import functions
. .\PrivateData.ps1 
. .\WorkItemUtilityFunctions.ps1

$orgUrl = Get-OrgURL #Example : https://dev.azure.com/XXXYYYZZZ
$project = Get-ProjectName #Example : ProjectXYZ
$personalToken = Get-PersonalAccessToken #Example : 7n6gzyzs4mla3xyzywjwxw6jlg7lxyz3zipeqqxf632dqtlbexyz
cls
#Demo 1
Write-Host ""
Write-Host "Demo 1 - Read existing Work Item from Azure Devops (Ids 1,2)" -ForegroundColor Yellow
$workItemIds = "1,2" #ids of Work Items comma seperated.
$workItemList = Get-WorkItems $orgUrl $project $personalToken $workItemIds
Write-HostWorkItemList $workItemList

#Demo 2
Write-Host ""
Write-Host "Demo 2 - Update existing Work Item (Id 1) from Azure Devops" -ForegroundColor Yellow
$workItemId = "1"
$newDescription = "<div>Time : " + [System.DateTime]::Now.ToLongDateString() + " : " + [System.DateTime]::Now.ToLongTimeString() + "</div>"
$historyUpdate = "updated description with current time via Powershell"
$updatedWorkItem = Update-WorkItemDescription $orgUrl $project $personalToken $workItemId $newDescription $historyUpdate
Write-HostWorkItem $updatedWorkItem

#Demo 3 
Write-Host ""
Write-Host "Demo 3 - Create a bug" -ForegroundColor Yellow
$title = "Sample Bug - Demo 3"
$retroSteps = "<div>Time : " + [System.DateTime]::Now.ToLongDateString() + " : " + [System.DateTime]::Now.ToLongTimeString() + "</div>"
$newBug = Create-Bug $orgUrl $project $personalToken $title $retroSteps
Write-HostWorkItem $newBug
Write-Host "RetroSteps : "  $newBug.fields.'Microsoft.VSTS.TCM.ReproSteps'

#Demo 4 
Write-Host ""
Write-Host "Demo 4 - Create a Product Backlog Item" -ForegroundColor Yellow
$title = "Sample Product Backlog Item - Demo 4"
$description = "<div>Time : " + [System.DateTime]::Now.ToLongDateString() + " : " + [System.DateTime]::Now.ToLongTimeString() + "</div>"
$newPBI = Create-ProductBacklogItem $orgUrl $project $personalToken $title $description
Write-HostWorkItem $newPBI

#Demo 5
Write-Host ""
Write-Host "Demo 5 - Create a task as a child of previously created Product Backlog Item" -ForegroundColor Yellow
Write-Host "This is useful for adding Definition of Done tasks by script to PBI" -ForegroundColor Yellow

Read-Host "press any key"
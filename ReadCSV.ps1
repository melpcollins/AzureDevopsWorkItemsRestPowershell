#
# ReadExcel.ps1
#
. .\PrivateData.ps1 
. .\WorkItemUtilityFunctions.ps1

$orgUrl = Get-OrgURL
$project = Get-ProjectName 
$personalToken = Get-PersonalAccessToken

#cs
$P = Import-Csv -Path .\Data.csv
$P | Get-Member
[int]$i = 0

foreach($a in $P)
{
	$i = $i + 1
	if($a.Effort -notlike "#N/A")
	{
		$a.Number
		$a.Area
		$a.Description
		$a.Effort

		$title = $a.Number + " : " + $a.Area
		$description = $a.Description + "<br/>" + "Please Read the SOW for details."
		$effort = $a.Effort

		$newPBI = Create-ProductBacklogItemEffort $orgUrl $project $personalToken $title $description $effort
	}
}
write-host $i


read-host "prest any key"
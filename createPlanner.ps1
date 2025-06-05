$ClientId = "<client id>"
$TenantId = "<tenant.onmicrosoft.com>"
$siteUrl= "< site url >"
Connect-PnPOnline -Url $siteUrl -ClientId $ClientId -Tenant $TenantId -Interactive

$groupId = Get-PnPPropertyBag -Key GroupId
# Get-PnPMicrosoft365GroupOwners -Identity $groupId 
Add-PnPMicrosoft365GroupMember -Identity $groupId -User "<user email>"

Get-PnPMicrosoft365GroupMembers -Identity $groupId

New-PnPPlannerPlan -Group $groupId -Title "Abc"

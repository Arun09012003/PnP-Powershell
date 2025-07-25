$ClientId = ""
$TenantId = "tenant.onmicrosoft.com"
$groupEmail = "test@tenant.onmicrosoft.com"
$siteUrl = "https://tenant.sharepoint.com/sites/test"
$adminUrl = "https://tenant-admin.sharepoint.com"

Connect-PnPOnline -Url $adminUrl -ClientId $ClientId -Tenant $TenantId -Interactive

Connect-ToPnPSite -siteUrlToConnect $adminUrl
$Group = Get-PnPMicrosoft365Group | Where Mail -eq $GroupEmail
Remove-PnPMicrosoft365Group -Identity $Group.id
Remove-PnPTenantDeletedSite -Identity $siteUrl 
Write-host "Deleted...!" -f Green
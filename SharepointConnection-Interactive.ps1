$ClientId = "< client id >"

$TenantId = "tenant.onmicrosoft.com"

Connect-PnPOnline -Url "https://tenant.sharepoint.com" -ClientId $ClientId -Tenant $TenantId -Interactive

#Disconnect-PnPOnline

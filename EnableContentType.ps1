$ClientId = "< client id >"
$TenantId = "< tenant id >"
Connect-PnPOnline -Url "< site url >" -ClientId $ClientId -Tenant $TenantId -Interactive

Set-PnPList -Identity "Shared Documents" -EnableContentTypes $True

$ClientId = "< client id >"
$TenantId = "< tenant.onmicrosoft.com >"

Connect-PnPOnline -Url "< site url >" -ClientId $ClientId -Tenant $TenantId -Interactive 
Get-PnPSiteTemplate -Configuration "< configuration file >" -Out "< file path to store xml template structure >"



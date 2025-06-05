# Register app on azure with certificate files .pfx & .cer files.
Register-PnPAzureADApp -ApplicationName "< appName >" -Tenant "tenant.onmicrosoft.com" -Store CurrentUser -SharePointApplicationPermissions "Sites.FullControl.All"

# Connection using certificate thumbprint.
$BaseURL = "https://tenant.sharepoint.com"

$ClientID = "< client id >"

$ThumbPrint = "< certificate thumbprint >"

$Tenant = "tenant.onmicrosoft.com"
 
Connect-PnPOnline -Url "$BaseURL" -ClientId $ClientID -Thumbprint $ThumbPrint -Tenant $Tenant

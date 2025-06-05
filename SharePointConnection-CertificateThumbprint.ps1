# Register app on azure with certificate files .pfx & .cer files.
Register-PnPAzureADApp -ApplicationName "App_Name" -Tenant "dgneaseteq.onmicrosoft.com" -Store CurrentUser -SharePointApplicationPermissions "Sites.FullControl.All"

# Connection using certificate thumbprint.
$BaseURL = "https://dgneaseteq.sharepoint.com"

$ClientID = "293f06c2-8425-47de-b12d-1c78cd3f6a0d"

$ThumbPrint = "04D06A24DEB15CA77749A42ADFE4A10B10066D0E"

$Tenant = "dgneaseteq.onmicrosoft.com"
 
Connect-PnPOnline -Url "$BaseURL" -ClientId $ClientID -Thumbprint $ThumbPrint -Tenant $Tenant
#Sharepoint Connection using certificate path and password. 
$BaseURL = "https://tenant.sharepoint.com"

$ClientID = "< client id >"

$Tenant = "tenant.onmicrosoft.com"

$CertificatePath = "<.pfx file path>"

$Password = (ConvertTo-SecureString -AsPlainText "< password >" -Force)

Connect-PnPOnline -ClientId $ClientID -CertificatePath $CertificatePath -CertificatePassword $Password -Url "$BaseURL" -Tenant $Tenant

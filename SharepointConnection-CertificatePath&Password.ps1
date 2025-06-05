#Sharepoint Connection using certificate path and password. 
$BaseURL = "https://dgneaseteq.sharepoint.com"

$ClientID = "293f06c2-8425-47de-b12d-1c78cd3f6a0d"

$Tenant = "dgneaseteq.onmicrosoft.com"

$CertificatePath = "C:\Users\EaseTeqLT08\Powershell Certificates\PnPPowerShell-App-Only-Authentication.pfx"

$Password = (ConvertTo-SecureString -AsPlainText "P@55w0rd" -Force)

Connect-PnPOnline -ClientId $ClientID -CertificatePath $CertificatePath -CertificatePassword $Password -Url "$BaseURL" -Tenant $Tenant
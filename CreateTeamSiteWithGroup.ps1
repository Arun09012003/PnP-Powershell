$BaseURL = "https://dgneaseteq.sharepoint.com/sites"
$ClientID = "293f06c2-8425-47de-b12d-1c78cd3f6a0d"
$Tenant = "dgneaseteq.onmicrosoft.com"
$CertificatePath = "C:\Users\EaseTeqLT08\Powershell Certificates\PnPPowerShell-App-Only-Authentication.pfx"
$Password = (ConvertTo-SecureString -AsPlainText "P@55w0rd" -Force)

Connect-PnPOnline -ClientId $ClientID -CertificatePath $CertificatePath -CertificatePassword $Password -Url "$BaseURL/Arun" -Tenant $Tenant

# If connection is CertificatePath then use this
New-PnPSite -Type TeamSite `
            -Title "Demo" `
            -Alias "Demo12334" `
            -Description ""

# If connection is Interactive then use this
# New-PnPSite -Type TeamSite `
#             -Title $siteTitle `
#             -Alias $alias `
#             -Owner "arunjatak@dgneaseteq.onmicrosoft.com"
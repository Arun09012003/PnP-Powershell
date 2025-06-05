$BaseURL = "https://tenant.sharepoint.com/sites"
$ClientID = "< client id >"
$Tenant = "tenant.onmicrosoft.com"
$CertificatePath = "< .pfx file path >"
$Password = (ConvertTo-SecureString -AsPlainText "< certificate password >" -Force)

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
#             -Owner "< user email >"

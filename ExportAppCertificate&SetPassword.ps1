# https://blog.admindroid.com/connect-to-sharepoint-online-with-certificate/#Connect%20to%20SPO%20using%20a%20certificate

# Export app certificate from azure and set password. 

$Cert = Get-ChildItem -Path Cert:\CurrentUser\My | Where-Object {$_.Subject -eq "CN=PnPPowerShell-App-Only-Authentication"}

$CertCerPath = "< .cer file path>"

Export-Certificate -Cert $Cert -FilePath $CertCerPath -Type CERT

$CertPfxPath = "< .pfx file path >"

$Password = ConvertTo-SecureString -String "<password>" -Force -AsPlainText

Export-PfxCertificate -Cert $Cert -FilePath $CertPfxPath -Password $Password

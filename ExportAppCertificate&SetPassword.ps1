# https://blog.admindroid.com/connect-to-sharepoint-online-with-certificate/#Connect%20to%20SPO%20using%20a%20certificate

# Export app certificate from azure and set password. 

$Cert = Get-ChildItem -Path Cert:\CurrentUser\My | Where-Object {$_.Subject -eq "CN=PnPPowerShell-App-Only-Authentication"}

$CertCerPath = "C:\Users\EaseTeqLT08\Powershell Certificates\PnPPowerShell-App-Only-Authentication.cer"

Export-Certificate -Cert $Cert -FilePath $CertCerPath -Type CERT

$CertPfxPath = "C:\Users\EaseTeqLT08\Powershell Certificates\PnPPowerShell-App-Only-Authentication.pfx"

$Password = ConvertTo-SecureString -String "P@55w0rd" -Force -AsPlainText

Export-PfxCertificate -Cert $Cert -FilePath $CertPfxPath -Password $Password
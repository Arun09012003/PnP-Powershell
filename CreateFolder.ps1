# Create folder in sharepoint document library using PnPPowershell.

$ClientId = "client id"
$TenantId = "<tenant.onmicrosoft.com>"
Connect-PnPOnline -Url "<site url>" -ClientId $ClientId -Tenant $TenantId -Interactive
$folderNames = @("Client-1001", "Client-1002", "Client-1003")
$libraryName = "Shared Documents"
foreach ($name in $folderNames) {
    Add-PnPFolder -Name $name -Folder $libraryName
}

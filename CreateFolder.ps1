# Create folder in sharepoint document library using PnPPowershell.

$ClientId = "d5aff94a-8d5e-4f4c-99f5-4abaec89dd7f"
$TenantId = "dgneaseteq.onmicrosoft.com"
Connect-PnPOnline -Url "https://dgneaseteq.sharepoint.com/sites/100102" -ClientId $ClientId -Tenant $TenantId -Interactive
$folderNames = @("Client-1001", "Client-1002", "Client-1003")
$libraryName = "Shared Documents"
foreach ($name in $folderNames) {
    Add-PnPFolder -Name $name -Folder $libraryName
}
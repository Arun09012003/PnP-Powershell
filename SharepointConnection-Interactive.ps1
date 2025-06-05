$ClientId = "d5aff94a-8d5e-4f4c-99f5-4abaec89dd7f"

$TenantId = "dgneaseteq.onmicrosoft.com"

Connect-PnPOnline -Url "https://dgneaseteq.sharepoint.com" -ClientId $ClientId -Tenant $TenantId -Interactive

Disconnect-PnPOnline
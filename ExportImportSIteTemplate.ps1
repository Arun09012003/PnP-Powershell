$ClientId = "d5aff94a-8d5e-4f4c-99f5-4abaec89dd7f"
$TenantId = "dgneaseteq.onmicrosoft.com"

Connect-PnPOnline -Url "https://dgneaseteq.sharepoint.com/sites/7777789" -ClientId $ClientId -Tenant $TenantId -Interactive 
Get-PnPSiteTemplate -Configuration "C:\Projects\PnP Powershell\Project\ExtractConfigurationSchemaForPages.JSON" -Out "C:\Projects\PnP Powershell\Project\SiteTemplate\TeamSiteStructure.xml"



# Get-PnPSiteTemplate -Out "C:\Projects\PnP Powershell\Project\SiteTemplate\ArunSiteTemplate.xml"

# Connect-PnPOnline -Url "https://dgneaseteq.sharepoint.com/sites/ISIte" -ClientId $ClientId -Tenant $TenantId -Interactive 
# Invoke-PnPSiteTemplate -Path "C:\Projects\PnP Powershell\Project\SiteTemplate\ArunSiteTemplate.xml"
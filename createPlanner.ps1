$ClientId = "d5aff94a-8d5e-4f4c-99f5-4abaec89dd7f"
$TenantId = "dgneaseteq.onmicrosoft.com"
$siteUrl= "https://dgneaseteq.sharepoint.com/sites/9999998"
Connect-PnPOnline -Url $siteUrl -ClientId $ClientId -Tenant $TenantId -Interactive

$groupId = Get-PnPPropertyBag -Key GroupId
# Get-PnPMicrosoft365GroupOwners -Identity $groupId 
Add-PnPMicrosoft365GroupMember -Identity $groupId -User "arunjatak@dgneaseteq.onmicrosoft.com"

Get-PnPMicrosoft365GroupMembers -Identity $groupId

New-PnPPlannerPlan -Group $groupId -Title "Abc"




# # Import-Module Microsoft.Graph.Planner
# # $ClientId = "d5aff94a-8d5e-4f4c-99f5-4abaec89dd7f"
# # $TenantId = "dgneaseteq.onmicrosoft.com"
# # $siteUrl= "https://dgneaseteq.sharepoint.com/sites/100100102"

# # Connect-PnPOnline -Url $siteUrl -ClientId $ClientId -Tenant $TenantId -Interactive

# #  $groupId = Get-PnPPropertyBag -Key GroupId

# # New-MgPlannerPlan -BodyParameter $params -Url https://graph.microsoft.com/v1.0/groups/$groupId -Title "TestPlanner"








# # $site = Get-PnPTenantSite -Url $siteUrl
# # if ($site.GroupId) {
# #     Write-Host "Group ID: $($site.GroupId)" -ForegroundColor Cyan
# #     $group = Get-PnPMicrosoft365Group -Identity $site.GroupId
# #     if ($group) {
# #         Write-Host "Group Name: $($group.DisplayName)" -ForegroundColor Cyan

# #         $plannerPlan = New-PnPPlannerPlan -Group  -Title "Conference Plan" 

# #         Write-Host "Planner Plan Created: $($plannerPlan.Title)" -ForegroundColor Green
# #     } else {
# #         Write-Host "No associated group found for $siteUrl" -ForegroundColor Red
# #     }
# # } else {
# #     Write-Host "No associated group found for $siteUrl" -ForegroundColor Red
# # }






# # $ClientId = "d5aff94a-8d5e-4f4c-99f5-4abaec89dd7f"
# # $TenantId = "dgneaseteq.onmicrosoft.com"
# # Connect-PnPOnline -Url "https://dgneaseteq-admin.sharepoint.com" -ClientId $ClientId -Tenant $TenantId -Interactive
# # Remove-PnPTenantSite -Url https://dgneaseteq.sharepoint.com/sites/1001001 -Force
# # Remove-PnPTenantSite -Url https://dgneaseteq.sharepoint.com/sites/1001002 -Force
# # Remove-PnPTenantSite -Url https://dgneaseteq.sharepoint.com/sites/1001003 -Force
# # Remove-PnPTenantSite -Url https://dgneaseteq.sharepoint.com/sites/1001004 -Force
# # Remove-PnPTenantSite -Url https://dgneaseteq.sharepoint.com/sites/1001005 -Force 

# # Remove-PnPTenantSite -Url https://dgneaseteq.sharepoint.com/sites/1001001 -Force -FromRecycleBin
# # Remove-PnPTenantSite -Url https://dgneaseteq.sharepoint.com/sites/1001002 -Force -FromRecycleBin
# # Remove-PnPTenantSite -Url https://dgneaseteq.sharepoint.com/sites/1001003 -Force -FromRecycleBin
# # Remove-PnPTenantSite -Url https://dgneaseteq.sharepoint.com/sites/1001004 -Force -FromRecycleBin
# # Remove-PnPTenantSite -Url https://dgneaseteq.sharepoint.com/sites/1001005 -Force -FromRecycleBin




# # $ClientId = "d5aff94a-8d5e-4f4c-99f5-4abaec89dd7f"
# # $TenantId = "dgneaseteq.onmicrosoft.com"
# # $csvPath = "C:\Projects\PnP Powershell\Project\Client.csv"
# # $baseUrl = "https://dgneaseteq.sharepoint.com/sites"

# # Connect-PnPOnline -Url "https://dgneaseteq-admin.sharepoint.com" -ClientId $ClientId -Tenant $TenantId -Interactive

# # $clients = Import-Csv -Path $csvPath

# # # Global wait to allow Content Type Hub to sync


# # foreach ($client in $clients) {
# #     $siteUrl = "$baseUrl/$($client.ClientNumber)"
# #     $siteTitle = $client.ClientName

# #     $existingSite = Get-PnPTenantSite -Filter "Url -eq '$siteUrl'" -ErrorAction SilentlyContinue

# #     if (-not $existingSite) {
# #         Write-Host "Creating site: $siteTitle ($siteUrl)" -ForegroundColor Cyan

# #         New-PnPTenantSite -Title $siteTitle `
# #                           -Url $siteUrl `
# #                           -Owner "arunjatak@dgneaseteq.onmicrosoft.com" `
# #                           -TimeZone 4 `
# #                           -Template "STS#3" `
# #                           -Lcid 1033 `
# #                           -RemoveDeletedSite

# #         Start-Sleep -Seconds 15

# #         Connect-PnPOnline -Url $siteUrl -ClientId $ClientId -Tenant $TenantId -Interactive

# #         $retryCount = 0
# #         $libraryExists = $false
# #         while ($retryCount -lt 10 -and -not $libraryExists) {
# #             try {
# #                 Get-PnPList -Identity "Shared Documents" -ErrorAction Stop
# #                 $libraryExists = $true
# #             } catch {
# #                 Write-Host "Waiting for Shared Documents to be provisioned..." -ForegroundColor DarkYellow
# #                 Start-Sleep -Seconds 10
# #                 $retryCount++
# #             }
# #         }

# #         if ($libraryExists) {
# #             Write-Host "Shared Documents library found." -ForegroundColor Green
            
# #             Set-PnPList -Identity "Shared Documents" -EnableContentTypes $True

# #             Write-Host "Waiting globally for Content Type Hub to sync..." -ForegroundColor Cyan
# #             Start-Sleep -Seconds 30

# #             Add-PnPContentTypesFromContentTypeHub -ContentTypes "0x01010097E7D4CF65DFB04EA47382EADE69C850"

# #             $retry = 0
# #             $content = $null
# #             while (-not $content -and $retry -lt 20) {
# #                 $content = Get-PnPContentType | Where-Object { $_.Name -eq "Client Document" }
# #                 if (-not $content) {
# #                     Write-Host "Waiting for 'Client Document' content type (Attempt $($retry+1))" -ForegroundColor DarkYellow
# #                     Start-Sleep -Seconds 5
# #                     $retry++
# #                 }
# #             }

# #             if ($content) {
# #                 $defaultContentType = Get-PnPContentType -List "Shared Documents" | Where-Object { $_.Name -eq "Document" }
# #                 if ($defaultContentType) {
# #                     Remove-PnPContentTypeFromList -List "Shared Documents" -ContentType $defaultContentType
# #                     Write-Host "Removed default 'Document' content type." -ForegroundColor Yellow
# #                 }

# #                 Add-PnPContentTypeToList -List "Shared Documents" -ContentType $content
# #                 Write-Host "'Client Document' content type added to document library." -ForegroundColor Green

# #                 $clientNumberString = $client.ClientNumber.ToString()
# #                 Write-Host "$($clientNumberString.GetType().FullName)"
# #                 Set-PnPDefaultColumnValues -List "Shared Documents" -Field "ClientNumber1" -Value $clientNumberString

# #                 Write-Host "Default 'ClientNumber1' set to '$($client.ClientNumber)' for 'Shared Documents'." -ForegroundColor Green
                
# #             } else {
# #                 Write-Host "Content type 'Client Document' not available after retries." -ForegroundColor Red
# #                 Write-Host "Available Content Types:"
# #                 Get-PnPContentType | Select-Object Name, Id
# #             }

# #             $folderNames = @("Folder-1001", "Folder-1002", "Folder-1003")
# #             foreach ($name in $folderNames) {
# #                 Add-PnPFolder -Name $name -Folder "Shared Documents"
# #             }
# #         } else {
# #             Write-Host "Shared Documents library not found." -ForegroundColor Red
# #         }




# #         $plannerUrl = "https://tasks.office.com/$TenantId/en-US/Home/Planner/#/planview"





# #         Connect-PnPOnline -Url "https://dgneaseteq.sharepoint.com/sites/Arun" -ClientId $ClientId -Tenant $TenantId -Interactive

# #         $list = Get-PnPList -Identity "Client List" -ErrorAction SilentlyContinue
# #         if (-not $list) {
# #             Write-Host "'Client List' not found. Skipping list item creation." -ForegroundColor Red
# #             continue
# #         }

# #         $docLibUrl = "$siteUrl/Shared%20Documents"

# #         Add-PnPListItem -List "Client List" -Values @{
# #             "ClientName"        = $client.ClientName
# #             "ClientNumber"      = $client.ClientNumber
# #             "ClientSiteURL"     = $siteUrl
# #             "ClientDocumentURL" = $docLibUrl
# #             "ClientPlannerURL"  = $plannerUrl
# #             "EmailAddress"      = $client.Email
# #             "City"              = $client.City
# #             "State"             = $client.State
# #             "District"          = ""
# #             "Country"           = $client.Country
# #         }

# #         Write-Host "Client entry added to SharePoint list." -ForegroundColor Green
# #     } else {
# #         Write-Host "Site already exists: $siteUrl" -ForegroundColor Yellow
# #     }
# # }







# # SharePoint Online connection parameters

# # $ClientId = "d5aff94a-8d5e-4f4c-99f5-4abaec89dd7f"
# # $TenantId = "dgneaseteq.onmicrosoft.com"
# # $baseUrl = "https://dgneaseteq.sharepoint.com/sites"

# # Connect-PnPOnline -Url "https://dgneaseteq.sharepoint.com/sites/100101" -ClientId $ClientId -Tenant $TenantId -Interactive

# # Get-PnPField -List "Shared Documents" -Identity "ClientNumber1"
# # Set-PnPDefaultColumnValues -List "Shared Documents" -Value @{"ClientNumber1"=$client.ClientNumber}
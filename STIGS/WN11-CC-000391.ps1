<#
SYNOPSIS
    Remediation using powershell script for the STIG ID: WN11-CC-000391 - Internet Explorer must be disabled for Windows 11.

NOTES
    Author          : Christopher Rajasekar
    LinkedIn        : https://www.linkedin.com/in/christopherrajasekar/
    GitHub          : https://github.com/Chrisrajasekar
    Date Created    : 2026-03-16
    Last Modified   : 2026-03-16
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000391

TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 
#>
Powershell Code:
# Run in elevated PowerShell

$FeatureName = "Internet-Explorer-Optional-amd64"

# Check current state
$feature = Get-WindowsOptionalFeature -Online -FeatureName $FeatureName

if ($feature.State -ne "Disabled") {
    Write-Host "Disabling Internet Explorer 11..."
    Disable-WindowsOptionalFeature -Online -FeatureName $FeatureName -NoRestart
    Write-Host "Internet Explorer has been disabled. A restart may be required."
} else {
    Write-Host "Internet Explorer is already disabled."
}

# Verify status
Get-WindowsOptionalFeature -Online -FeatureName $FeatureName

Result: WN11-CC-000391 is successfully remediated and compliant.

 Get-WindowsOptionalFeature -Online -FeatureName $FeatureName
Disabling Internet Explorer 11... 
Disable-WindowsOptionalFeature : Feature name Internet-Explorer-Optional-amd64 is unknown. 
Internet Explorer has been disabled. A restart may be required. 

PS C:\Users\christoadmin> Test-Path "C:\Program Files\Internet Explorer\iexplore.exe"
True 

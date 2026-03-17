<#
SYNOPSIS
    Remediation using powershell script for the STIG ID: WN11-CC-000310 - Users must be prevented from changing installation options..

NOTES
    Author          : Christopher Rajasekar
    LinkedIn        : https://www.linkedin.com/in/christopherrajasekar/
    GitHub          : https://github.com/Chrisrajasekar
    Date Created    : 2026-03-16
    Last Modified   : 2026-03-16
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000310

TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 
#>
Powershell Code

$RegPath = "HKLM:\Software\Policies\Microsoft\Windows\Installer"

# Create the registry path if it does not exist
if (!(Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the policy to prevent users from changing installation options
Set-ItemProperty -Path $RegPath -Name "DisableUserInstalls" -Type DWord -Value 1

# Verify the configuration
Get-ItemProperty -Path $RegPath -Name "DisableUserInstalls"

Result:
 DisableUserInstalls : 1
PSPath              : Microsoft.PowerShell.Core\Registry::HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Installer
PSParentPath        : Microsoft.PowerShell.Core\Registry::HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows
PSChildName         : Installer
PSDrive             : HKLM
PSProvider          : Microsoft.PowerShell.Core\Registry 


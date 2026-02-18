<#
SYNOPSIS
    Remediation using powershell script for the STIG - WN11-CC-000185 - The default autorun behavior must be configured to prevent autorun commands.

NOTES
    Author          : Christopher Rajasekar
    LinkedIn        : https://www.linkedin.com/in/christopherrajasekar/
    GitHub          : https://github.com/Chrisrajasekar
    Date Created    : 2026-02-15
    Last Modified   : 2026-02-17
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000185

TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 
#>
Code
# Define registry path
$RegistryPath = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"

# Create the key if it does not exist
If (!(Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force
}

# Set policy to prevent autorun commands
Set-ItemProperty -Path $RegistryPath -Name "NoAutorun" -Type DWord -Value 1

# Verify configuration
Get-ItemProperty -Path $RegistryPath -Name "NoAutorun"

Result:
 NoAutorun    : 1
PSPath       : Microsoft.PowerShell.Core\Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer
PSParentPath : Microsoft.PowerShell.Core\Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies
PSChildName  : Explorer
PSDrive      : HKLM
PSProvider   : Microsoft.PowerShell.Core\Registry 




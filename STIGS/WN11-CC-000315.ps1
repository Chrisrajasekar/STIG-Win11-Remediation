<#
SYNOPSIS
    Remediation using powershell script for the STIG ID: WN11-CC-000315 - The Windows Installer feature "Always install with elevated privileges" must be disabled.

NOTES
    Author          : Christopher Rajasekar
    LinkedIn        : https://www.linkedin.com/in/christopherrajasekar/
    GitHub          : https://github.com/Chrisrajasekar
    Date Created    : 2026-03-16
    Last Modified   : 2026-03-16
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000315

TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 
#>
Powershell Code

$HKLMPath = "HKLM:\Software\Policies\Microsoft\Windows\Installer"
$HKCUPath = "HKCU:\Software\Policies\Microsoft\Windows\Installer"

# Create registry paths if they do not exist
if (!(Test-Path $HKLMPath)) {
    New-Item -Path $HKLMPath -Force | Out-Null
}

if (!(Test-Path $HKCUPath)) {
    New-Item -Path $HKCUPath -Force | Out-Null
}

# Disable AlwaysInstallElevated
Set-ItemProperty -Path $HKLMPath -Name "AlwaysInstallElevated" -Type DWord -Value 0
Set-ItemProperty -Path $HKCUPath -Name "AlwaysInstallElevated" -Type DWord -Value 0

# Verify settings
Write-Host "Verification:"
Get-ItemProperty -Path $HKLMPath -Name "AlwaysInstallElevated"
Get-ItemProperty -Path $HKCUPath -Name "AlwaysInstallElevated"


Result:
 The command was successfully executed.

Verification:
AlwaysInstallElevated : 0
PSPath                : Microsoft.PowerShell.Core\Registry::HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Wi
                        ndows\Installer
PSParentPath          : Microsoft.PowerShell.Core\Registry::HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Wi
                        ndows
PSChildName           : Installer
PSDrive               : HKLM
PSProvider            : Microsoft.PowerShell.Core\Registry

AlwaysInstallElevated : 0
PSPath                : Microsoft.PowerShell.Core\Registry::HKEY_CURRENT_USER\Software\Policies\Microsoft\Win
                        dows\Installer
PSParentPath          : Microsoft.PowerShell.Core\Registry::HKEY_CURRENT_USER\Software\Policies\Microsoft\Win
                        dows
PSChildName           : Installer
PSDrive               : HKCU
PSProvider            : Microsoft.PowerShell.Core\Registry 


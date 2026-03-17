<#
SYNOPSIS
    Remediation using powershell script for the STIG ID: WN11-CC-000326 - PowerShell script block logging must be enabled on Windows 11.

NOTES
    Author          : Christopher Rajasekar
    LinkedIn        : https://www.linkedin.com/in/christopherrajasekar/
    GitHub          : https://github.com/Chrisrajasekar
    Date Created    : 2026-03-16
    Last Modified   : 2026-03-16
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000326

TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 
#>
Powershell Code:
# Run in elevated PowerShell

$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging"

# Create registry path if it does not exist
if (!(Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Enable PowerShell Script Block Logging
Set-ItemProperty -Path $RegPath -Name "EnableScriptBlockLogging" -Type DWord -Value 1

# Verify configuration
Get-ItemProperty -Path $RegPath -Name "EnableScriptBlockLogging"


Result: WN11-CC-000326 is successfully remediated and compliant.

 EnableScriptBlockLogging : 1
PSPath                   : Microsoft.PowerShell.Core\Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerSh
                           ell\ScriptBlockLogging
PSParentPath             : Microsoft.PowerShell.Core\Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerSh
                           ell
PSChildName              : ScriptBlockLogging
PSDrive                  : HKLM
PSProvider               : Microsoft.PowerShell.Core\Registry 

<#
SYNOPSIS
    Remediation using powershell script for the STIG ID: WN11-CC-000110 - Printing over HTTP must be prevented.

NOTES
    Author          : Christopher Rajasekar
    LinkedIn        : https://www.linkedin.com/in/christopherrajasekar/
    GitHub          : https://github.com/Chrisrajasekar
    Date Created    : 2026-03-15
    Last Modified   : 2026-03-16
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000110

TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 
#>
Powershell Code

$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers"
$valueName = "DisableHTTPPrinting"
$valueData = 1

# Create the registry path if it does not exist
if (!(Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the required registry value
New-ItemProperty -Path $regPath `
    -Name $valueName `
    -Value $valueData `
    -PropertyType DWord `
    -Force | Out-Null

Write-Output "Remediation applied: Printing over HTTP has been disabled."

Result:
 The command was successfully executed.Remediation applied: Printing over HTTP has been disabled.


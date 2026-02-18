<#
SYNOPSIS
    Remediation using powershell script for the STIG - WN11-SO-000025 - The built-in guest account must be renamed.

NOTES
    Author          : Christopher Rajasekar
    LinkedIn        : https://www.linkedin.com/in/christopherrajasekar/
    GitHub          : https://github.com/Chrisrajasekar
    Date Created    : 2026-02-15
    Last Modified   : 2026-02-16
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-SO-000025

TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 
#>

# CODE
# Get the Guest account object
$guest = Get-LocalUser -Name "Guest"

# Rename to a new name (e.g., "SysGuest01")
Rename-LocalUser -InputObject $guest -NewName "SysGuest01"

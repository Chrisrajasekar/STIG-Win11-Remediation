<#
SYNOPSIS
    Remediation using powershell script for the STIG ID: WN11-AU-00056 - Windows 11 must be configured to audit other Logon/Logoff Events Successes.

NOTES
    Author          : Christopher Rajasekar
    LinkedIn        : https://www.linkedin.com/in/christopherrajasekar/
    GitHub          : https://github.com/Chrisrajasekar
    Date Created    : 2026-03-16
    Last Modified   : 2026-03-16
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000560

TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 
#>
Powershell Code

# Enable auditing of Success events for Other Logon/Logoff Events
auditpol /set /subcategory:"Other Logon/Logoff Events" /success:enable

# Verify the configuration
auditpol /get /subcategory:"Other Logon/Logoff Events"

Result: 
 PS C:\Users\christoadmin> # Enable auditing of Success events for Other Logon/Logoff Events
auditpol /set /subcategory:"Other Logon/Logoff Events" /success:enable

# Verify the configuration
auditpol /get /subcategory:"Other Logon/Logoff Events"
The command was successfully executed.

System audit policy

Category/Subcategory                      Setting
Logon/Logoff
  Other Logon/Logoff Events               Success 




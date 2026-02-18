<#
SYNOPSIS
    Remediation using powershell script for the STIG - WN11-AU-000010 - The system must be configured to audit Account Logon - Credential Validation successes.

NOTES
    Author          : Christopher Rajasekar
    LinkedIn        : https://www.linkedin.com/in/christopherrajasekar/
    GitHub          : https://github.com/Chrisrajasekar
    Date Created    : 2026-02-15
    Last Modified   : 2026-02-17
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000010

TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 
#>
Code
# Enable auditing of Credential Validation SUCCESS events
auditpol /set /subcategory:"Credential Validation" /success:enable

Result:
The command was successfully executed. 
 PS C:\Users\christoadmin> auditpol /set /subcategory:"Credential Validation" /success:enable 

# Verify the setting
auditpol /get /subcategory:"Credential Validation"

Result:
 The command was successfully executed.

System audit policy

Category/Subcategory                      Setting
Account Logon
  Credential Validation                   Success 
 PS C:\Users\christoadmin> auditpol /set /subcategory:"Credential Validation" /success:enable 







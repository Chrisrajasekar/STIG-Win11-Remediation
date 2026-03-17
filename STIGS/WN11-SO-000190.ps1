<#
SYNOPSIS
    Remediation using powershell script for the STIG ID: WN11-SO-000190 - Kerberos encryption types must be configured to prevent the use of DES and RC4 encryption suites

NOTES
    Author          : Christopher Rajasekar
    LinkedIn        : https://www.linkedin.com/in/christopherrajasekar/
    GitHub          : https://github.com/Chrisrajasekar
    Date Created    : 2026-03-16
    Last Modified   : 2026-03-16
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-SO-000190

TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 
#>
Powershell Code:
 # Run in elevated PowerShell

$RegPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters"

# Create registry path if it does not exist
if (!(Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set supported Kerberos encryption types to AES128 + AES256 only
Set-ItemProperty -Path $RegPath -Name "SupportedEncryptionTypes" -Type DWord -Value 24

# Verify configuration
Get-ItemProperty -Path $RegPath -Name "SupportedEncryptionTypes" 

Result: WN11-SO-000190 is successfully remediated and compliant.

 SupportedEncryptionTypes : 24
PSPath                   : Microsoft.PowerShell.Core\Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Kerb
                           eros\Parameters
PSParentPath             : Microsoft.PowerShell.Core\Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Kerb
                           eros
PSChildName              : Parameters
PSDrive                  : HKLM
PSProvider               : Microsoft.PowerShell.Core\Registry 

Explaining the result:
For STIG ID: WN11-SO-000190, the system must prevent DES and RC4 Kerberos encryption and allow only stronger encryption types.

The value 24 corresponds to:

Value	         Encryption Type
8	             AES128_HMAC_SHA1
16	           AES256_HMAC_SHA1
24 (8 + 16)	   AES128 + AES256 only

This means:

✅ AES128 enabled
✅ AES256 enabled
❌ DES disabled
❌ RC4 disabled

Which is exactly what the STIG requires.

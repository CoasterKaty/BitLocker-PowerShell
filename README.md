# BitLocker-PowerShell
PowerShell script to encrypt a device's OS disk using the device serial as the PIN

## Pre-req settings

BitLocker - Endpoint Protection settings:
Additional auth at start up: require
TPM startup: do not allow
TPM startup PIN: Require PIN with TPM
TPM key: do not allow
TPM key and PIN: do not allow

Settings Catalog type profile:

Windows Components > BitLocker Drive Encryption > Operating System Drives - Allow enhanced PINs for Startup, Enabled


# BitLocker-PowerShell
PowerShell script to encrypt a device's OS disk using the device serial as the PIN. See https://katystech.blog/mem/bitlocker-with-pin for details.

This script is intended to be pushed to devices through Intune, and if pushed to Autopilot devices should ensure that they are encrypted by the time the user first logs on. While using the device serial is not a very secure choice for a PIN, it means the disk will have some level of protection and that a standard user can change the PIN to something more secure and personal.

## Pre-requisite settings

BitLocker - Endpoint Protection settings:
Additional auth at start up: require
TPM startup: do not allow
TPM startup PIN: Require PIN with TPM
TPM key: do not allow
TPM key and PIN: do not allow

Settings Catalog type profile:

Windows Components > BitLocker Drive Encryption > Operating System Drives - Allow enhanced PINs for Startup, Enabled


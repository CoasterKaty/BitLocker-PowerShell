$OSVolume = Get-BitlockerVolume | Where {$_.VolumeType -eq "OperatingSystem"}
if ($OSVolume.VolumeStatus -eq "FullyDecrypted") {
  $DeviceSerial = (Get-WmiObject win32_bios).Serialnumber
  $DevicePIN = ConvertTo-SecureString $DeviceSerial -AsPlainText -Force
  Add-BitlockerKeyProtector -MountPoint $OSVolume.MountPoint -RecoveryPasswordProtector
  Enable-BitLocker -MountPoint $OSVolume.MountPoint -Pin $DevicePIN -TPMandPinProtector
  $RecoveryKeyID = ((Get-BitlockerVolume).KeyProtector | Where {$_.KeyProtectorType -eq "RecoveryPassword"}).KeyProtectorId
  BackupToAAD-BitlockerKeyProtector -MountPoint $OSVolume.MountPoint -KeyProtectorId $RecoveryKeyID
  shutdown.exe /r /f /t 60
}

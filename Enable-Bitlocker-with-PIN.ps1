$OSVolume = Get-BitlockerVolume | Where {$_.VolumeType -eq "OperatingSystem"}
if ($OSVolume.VolumeStatus -eq "FullyDecrypted") {
  $DeviceSerial = (Get-WmiObject win32_bios).Serialnumber
  $DevicePIN = ConvertTo-SecureString $DeviceSerial -AsPlainText -Force
  Enable-BitLocker -MountPoint $OSVolume.MountPoint -Pin $DevicePIN -TPMandPinProtector
  shutdown.exe /r /f /t 60
}

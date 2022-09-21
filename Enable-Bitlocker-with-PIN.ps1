$OSVolume = Get-BitlockerVolume | Where {$_.VolumeType -eq "OperatingSystem"}
if ($OSVolume.VolumeStatus -eq "FullyDecrypted") {
  $DeviceSerial = (Get-WmiObject win32_bios).Serialnumber
  $DevicePIN = ConvertTo-SecureString $DeviceSerial -AsPlainText -Force
  Enable-BitLocker -MountPoint $OSVolume.MountPoint -EncryptionMethod Aes256 -UsedSpaceOnly -Pin $DevicePIN -TPMandPinProtector
}

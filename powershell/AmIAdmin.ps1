If ([bool](([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544")) {
  Write-Host "You are an administrator" 
  Exit 0
}
else {
  Write-Host "NOT an administrator"
  Exit 1
}

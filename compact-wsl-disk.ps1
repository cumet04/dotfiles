# WSLのストレージファイルをcompactするやつ
# docker system pruneなどは行ってから
# In admin powershell, "powershell -ExecutionPolicy Bypass .\compact-wsl-disk.ps1"

$ErrorActionPreference = "Stop"

# refs https://github.com/microsoft/WSL/issues/4607#issuecomment-1197258447
$env:WSL_UTF8=1
wsl --list -q | ForEach-Object {
  wsl -d $PSItem -e sudo fstrim /
}
wsl --shutdown

Get-ChildItem -Recurse -Path "$env:LOCALAPPDATA\Packages" -Filter ext4.vhdx | ForEach-Object {
  $disk = $PSItem.FullName

@"
select vdisk file=$disk
attach vdisk readonly
compact vdisk
detach vdisk
exit
"@ | diskpart
}

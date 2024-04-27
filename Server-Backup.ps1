$sourcePath = "\\Server-GUI\Executeables"
$destinationPath = "C:\Backup"

$backupFolder = Join-Path -Path $destinationPath -ChildPath (Get-Date -Format "yyyyMMddHHmmss")

New-Item -ItemType Directory -Path $backupFolder

Copy-Item -Path $sourcePath\* -Destination $backupFolder -Recurse

$backupLog = Join-Path -Path $destinationPath -ChildPath "backup.log"
Add-Content -Path $backupLog -Value "Backup completed on $(Get-Date)"

$ErrorActionPreference = "Stop"
$here = Get-Location
$zip = "PacketPlus-main.zip"
$dest = Join-Path $here "src"

Invoke-WebRequest -Uri "https://codeload.github.com/AlexanderLindholt/PacketPlus/zip/refs/heads/main" -OutFile $zip
Expand-Archive -LiteralPath $zip -DestinationPath . -Force


$src = Join-Path $here "PacketPlus-main\source"
Copy-Item -Path (Join-Path $src "*") -Destination $dest -Recurse -Force


Remove-Item -Force $zip
Remove-Item -Recurse -Force (Join-Path $here "PacketPlus-main")

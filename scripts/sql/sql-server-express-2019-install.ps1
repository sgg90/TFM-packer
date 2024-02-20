
New-Item -ItemType Directory -Path "C:\SQL\SQLEXPR"
Set-Location C:\SQL

$url = 'https://download.microsoft.com/download/7/f/8/7f8a9c43-8c8a-4f7c-9f92-83c18d96b681/SQL2019-SSEI-Expr.exe'
$outputPath = 'C:\SQL\SQL2019-SSEI-Expr.exe'

Invoke-WebRequest -Uri $url -OutFile $outputPath

Start-Process -NoNewWindow -FilePath ".\SQL2019-SSEI-Expr.exe" -ArgumentList "/ACTION=Download MEDIAPATH=C:\SQL /MEDIATYPE=Core /QUIET" -Wait

Start-Process -NoNewWindow -FilePath ".\SQLEXPR_x64_ESN.exe" -ArgumentList "/q /x:C:\SQL\SQLEXPR" -Wait

Set-Location C:\SQL\SQLEXPR

Copy-Item -Path "C:\vagrant\sql\ConfigurationFile.ini" -Destination "C:\SQL\SQLEXPR\ConfigurationFile.ini"

Start-Process -NoNewWindow -FilePath ".\SETUP.EXE" -ArgumentList "/ConfigurationFile=ConfigurationFile.ini" -Wait

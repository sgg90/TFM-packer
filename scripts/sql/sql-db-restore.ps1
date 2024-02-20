
New-Item -ItemType Directory -Path "C:\SQL\BACKUP"

Copy-Item -Path "C:\vagrant\sql\bak\TFM_UNIR.bak" -Destination "C:\SQL\BACKUP\TFM_UNIR.bak"

# Variables
$serverInstance = "win2022image\SQLEXPRESS"
$databaseName = "TFM_UNIR"
$backupFilePath = "C:\SQL\BACKUP\Archivo.bak"

# Comando sqlcmd para crear y restaurar la base de datos desde el archivo .bak
sqlcmd -S $serverInstance -U sa -P Unir123 -Q "RESTORE DATABASE [$databaseName] FROM DISK = '$backupFilePath' WITH REPLACE, STATS = 5"
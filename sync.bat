@echo off
setlocal

REM URLs for files to be downloaded and synced
set "github_sync_url=https://raw.githubusercontent.com/arbs09/update-script/master/sync.bat"
set "github_updatescript_url=https://raw.githubusercontent.com/arbs09/update-script/master/updatescript.bat"

REM Create a log folder if it doesn't exist
if not exist "%folder%\logs" mkdir "%folder%\logs"

REM Log start of sync
echo [%date% %time%] Sync started >> "%folder%\logs\sync_log.txt"

REM Download the sync.bat and updatescript.bat from GitHub
curl -o "%folder%\sync.bat" "%github_sync_url%"
curl -o "%folder%\updatescript.bat" "%github_updatescript_url%"

REM Log completion message
echo [%date% %time%] Sync is complete! >> "%folder%\logs\sync_log.txt"

endlocal

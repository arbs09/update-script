@echo off
setlocal

REM Log start of updatescript
echo [%date% %time%] Update script started >> "%userprofile%\updatescript from arbs09\logs\updatescript_log.txt"

REM Run the command in the background and redirect output to log
start "" cmd /c "winget upgrade --all --include-unknown > "%userprofile%\updatescript from arbs09\logs\winget_log.txt" 2>&1"

REM Log completion message
echo [%date% %time%] Update script is complete! >> "%userprofile%\updatescript from arbs09\logs\updatescript_log.txt"

endlocal

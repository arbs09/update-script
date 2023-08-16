@echo off
setlocal

REM Log autostart_update.bat run
echo [%date% %time%] autostart_update.bat run >> "%userprofile%\updatescript from arbs09\logs\autostart_update_log.txt"

REM Run sync.bat in the background
start "" /min "%userprofile%\updatescript from arbs09\sync.bat"

:end
REM Log end of autostart_update.bat run
echo [%date% %time%] autostart_update.bat run ended >> "%userprofile%\updatescript from arbs09\logs\autostart_update_log.txt"

endlocal

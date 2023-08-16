@echo off
setlocal

REM Log autostart_update.bat run
echo [%date% %time%] autostart_update.bat run >> "%folder%\logs\autostart_update_log.txt"

REM Run sync.bat in the background
start "" /min "%folder%\sync.bat"

:end
REM Log end of autostart_update.bat run
echo [%date% %time%] autostart_update.bat run ended >> "%folder%\logs\autostart_update_log.txt"

endlocal

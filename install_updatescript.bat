@echo off
setlocal

REM Create the folder in the user's home directory
set "folder=%userprofile%\updatescript from arbs09"
mkdir "%folder%"
mkdir "%folder%\logs"

REM Log the installation start
echo [%date% %time%] Installation started. >> "%folder%\logs\installer_log.txt"

REM Download updatescript.bat
set "updatescript_url=https://raw.githubusercontent.com/arbs09/update-script/master/updatescript.bat"
curl -o "%folder%\updatescript.bat" %updatescript_url%
REM Log the updatescript.bat download
echo [%date% %time%] updatescript.bat downloaded. >> "%folder%\logs\installer_log.txt"

REM Download sync.bat
set "sync_url=https://raw.githubusercontent.com/arbs09/update-script/master/sync.bat"
curl -o "%folder%\sync.bat" %sync_url%
REM Log the sync.bat download
echo [%date% %time%] sync.bat downloaded. >> "%folder%\logs\installer_log.txt"

REM Create autostart.config and write the chosen schedule
set /p "schedule=Choose autostart schedule (day/week/14days/month/2months/manual): "
echo %schedule% > "%folder%\autostart.config"

REM Log the chosen schedule
echo [%date% %time%] Chosen autostart schedule: %schedule% >> "%folder%\logs\installer_log.txt"

REM Create autostart_update.bat
set "autostart_update_url=https://raw.githubusercontent.com/arbs09/update-script/master/autostart_update.bat"
curl -o "%folder%\autostart_update.bat" %autostart_update_url%
REM Log the autostart_update.bat download
echo [%date% %time%] autostart_update.bat downloaded. >> "%folder%\logs\installer_log.txt"

REM Create autostart_scheduled.bat (if schedule is not "manual")
if "%schedule%" neq "manual" (
    set "autostart_scheduled_url=https://raw.githubusercontent.com/arbs09/update-script/master/autostart_scheduled.bat"
    curl -o "%folder%\autostart_scheduled.bat" %autostart_scheduled_url%
    REM Log the autostart_scheduled.bat download
    echo [%date% %time%] autostart_scheduled.bat downloaded. >> "%folder%\logs\installer_log.txt"
) else (
    REM Log the manual option
    echo [%date% %time%] Manual option chosen. autostart_scheduled.bat not downloaded. >> "%folder%\logs\installer_log.txt"
)

REM Rename and move files if needed
rename "%folder%\autostart_update.bat" "updatescript_update.bat"
rename "%folder%\autostart_scheduled.bat" "updatescript.bat"

REM Download uninstall.bat
set "uninstall_url=https://raw.githubusercontent.com/arbs09/update-script/master/uninstall.bat"
set "uninstall_file=%folder%\uninstall.bat"

curl -o "%uninstall_file%" %uninstall_url%

REM Log the uninstall.bat download
echo [%date% %time%] uninstall.bat downloaded. >> "%folder%\installer_log.txt"

REM Log the installation completion
echo [%date% %time%] Installation completed. >> "%folder%\logs\installer_log.txt"

REM Display completion message
echo Installation is complete.

REM Wait for user to press Enter before exiting
pause > nul

endlocal

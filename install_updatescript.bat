@echo off
setlocal

REM Set the folder path
set "folder=%userprofile%\updatescript from arbs09"

REM Create the folder if it doesn't exist
mkdir "%folder%"
mkdir "%folder%\logs"

REM Log installation start
echo [%date% %time%] Installation started >> "%folder%\logs\install_log.txt"

REM Download updatescript.bat and sync.bat from GitHub
set "github_updatescript_url=https://raw.githubusercontent.com/arbs09/update-script/master/updatescript.bat"
set "github_sync_url=https://raw.githubusercontent.com/arbs09/update-script/master/sync.bat"
curl -o "%folder%\updatescript.bat" "%github_updatescript_url%"
curl -o "%folder%\sync.bat" "%github_sync_url%"

REM Log download of updatescript.bat and sync.bat
echo [%date% %time%] Downloaded updatescript.bat from GitHub >> "%folder%\logs\install_log.txt"
echo [%date% %time%] Downloaded sync.bat from GitHub >> "%folder%\logs\install_log.txt"

REM Popup to choose autostart schedule
set /p "schedule=Choose autostart schedule (day/week/14days/month/2months): "
echo %schedule% > "%folder%\autostart.config"

REM Log autostart schedule choice
echo [%date% %time%] Autostart schedule choice: %schedule% >> "%folder%\logs\install_log.txt"

REM Create autostart_scheduled.bat and autostart_update.bat
set "local_autostart_scheduled_path=%folder%\autostart_scheduled.bat"
set "local_autostart_update_path=%folder%\autostart_update.bat"
set "github_autostart_scheduled_url=https://raw.githubusercontent.com/arbs09/update-script/master/autostart_scheduled.bat"
set "github_autostart_update_url=https://raw.githubusercontent.com/arbs09/update-script/master/autostart_update.bat"
curl -o "%local_autostart_scheduled_path%" "%github_autostart_scheduled_url%"
curl -o "%local_autostart_update_path%" "%github_autostart_update_url%"

REM Rename updatescript_update.bat to updatescript.bat and move autostart scripts
rename "%folder%\updatescript_update.bat" "updatescript.bat"
move "%local_autostart_scheduled_path%" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
move "%local_autostart_update_path%" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

REM Log autostart script movements
echo [%date% %time%] Autostart scripts moved to Startup folder >> "%folder%\logs\install_log.txt"

REM Log installation completion
echo [%date% %time%] Installation is complete! >> "%folder%\logs\install_log.txt"

REM Display completion message to the user
echo Installation is complete.
pause

endlocal

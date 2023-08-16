@echo off
setlocal

REM Create a folder in the user's home directory
set "folder=%userprofile%\updatescript from arbs09"
mkdir "%folder%"

REM Download updatescript.bat and sync.bat from GitHub
set "github_updatescript_url=https://raw.githubusercontent.com/arbs09/update-script/master/updatescript.bat"
set "github_sync_url=https://raw.githubusercontent.com/arbs09/update-script/master/sync.bat"
curl -o "%folder%\updatescript.bat" "%github_updatescript_url%"
curl -o "%folder%\sync.bat" "%github_sync_url%"

REM Popup to choose autostart schedule
set /p "schedule=Choose autostart schedule (day/week/14days/month/2months): "
echo %schedule% > "%folder%\autostart.config"

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

REM Log completion message
echo [%date% %time%] Install is complete! >> "%folder%\install_log.txt"

endlocal

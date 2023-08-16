@echo off
setlocal

REM Set the folder path
set "folder=%userprofile%\updatescript from arbs09"

REM Delete logs folder and all its contents
if exist "%folder%\logs" (
    rmdir /s /q "%folder%\logs"
)

REM Delete autostart files
if exist "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\updatescript.bat" (
    del "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\updatescript.bat"
)

REM Delete installation files
if exist "%folder%" (
    rmdir /s /q "%folder%"
)

REM Display completion message
echo Uninstallation is complete.

REM Wait for user to press Enter before exiting
pause > nul

endlocal

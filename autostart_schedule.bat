@echo off
setlocal

REM Get autostart schedule from autostart.config
set /p "schedule=" < "%folder%\autostart.config"

REM Determine the times based on the chosen schedule
if "%schedule%"=="day" (
    set "times=00:00 01:00 02:00" REM Add desired times
) elseif "%schedule%"=="week" (
    set "times=00:00 01:00" REM Add desired times
) elseif "%schedule%"=="14days" (
    set "times=00:00" REM Add desired times
) elseif "%schedule%"=="month" (
    set "times=00:00" REM Add desired times
) elseif "%schedule%"=="2months" (
    set "times=00:00" REM Add desired times
)

REM Log autostart_scheduled.bat run
echo [%date% %time%] autostart_scheduled.bat run >> "%folder%\logs\autostart_scheduled_log.txt"

REM Loop to check schedule and run updatescript.bat at specified times
:loop
for %%t in (%times%) do (
    set "current_time=%%t"
    for /f "delims=: tokens=1,2" %%h in ("%current_time%") do (
        set "hour=%%h"
        set "minute=%%i"
    )
    REM Check if current time matches specified time
    for /f "tokens=1 delims=." %%A in ('powershell "(get-date).DayOfWeek"') do (
        set "current_day=%%A"
        if "%schedule%"=="week" (
            if /i "%%A"=="Sunday" (
                if "%hour%"=="%%h" (
                    if "%minute%"=="%%i" (
                        call :run_updatescript
                    )
                )
            )
        ) else (
            if /i "%schedule%"=="%%A" (
                if "%hour%"=="%%h" (
                    if "%minute%"=="%%i" (
                        call :run_updatescript
                    )
                )
            )
        )
    )
)
REM Delay for one minute before looping again
ping -n 61 127.0.0.1 > nul
goto :loop

:run_updatescript
REM Run updatescript.bat in the background
start "" /min "%folder%\updatescript.bat"
goto :eof

:end
REM Log end of autostart_scheduled.bat run
echo [%date% %time%] autostart_scheduled.bat run ended >> "%folder%\logs\autostart_scheduled_log.txt"

endlocal

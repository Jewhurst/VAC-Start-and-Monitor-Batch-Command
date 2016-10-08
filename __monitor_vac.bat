@echo off
title __monitor_vac.bat
echo Confirming VAC audio already running...
C:\Windows\System32\tasklist /FI "IMAGENAME eq audiorepeater.exe" 2>NUL | C:\Windows\System32\find /I /N "audiorepeater.exe">NUL
if "%ERRORLEVEL%"=="0" goto loop
echo VAC appears to have faulted. Executing cleanup... 
start "" /min /wait "C:\Program Files\Virtual Audio Cable\x64\__start_vac.bat" 
timeout 30
echo VAC executed.
goto started
:loop
cls
echo VAC is working. Continue to monitor...
:started
taskkill /f /im WerFault.exe /fi "WINDOWTITLE eq Audio Repeater 1.53"
C:\Windows\System32\timeout /t 80
C:\Windows\System32\tasklist /FI "IMAGENAME eq audiorepeater.exe" 2>NUL | C:\Windows\System32\find /I /N "audiorepeater.exe">NUL
if "%ERRORLEVEL%"=="0" goto loop
goto start

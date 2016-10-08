@echo off
title __start_vac.bat
echo Clear any VAC audio already running...
taskkill /f /fi "status eq not responding" /im audiorepeater.exe
taskkill /f /im audiorepeater.exe
timeout 1
echo VAC faults are clear. Ready to execute VAC...
start "" "C:\Program Files\Virtual Audio Cable\x64\audiorepeater.exe"
timeout 1
start "" "C:\Program Files\Virtual Audio Cable\x64\audiorepeater.exe"
timeout 1
echo Starting VAC monitor...
start "" /min "C:\Program Files\Virtual Audio Cable 4.15\__monitor_vac.bat"
echo VAC Monitor has started. Exiting in..
timeout 3
exit

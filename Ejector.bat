@echo off
title Ejector v.1
color 4
set load=
set/a loadnum=0

:Loading
set load=%load%##
set/a percent=%loadnum% /2 *10
cls
echo.
type header.txt
echo.
echo Loading %percent%%%
echo ==========================================
echo %load%
echo ==========================================
ping localhost -n 1.5 >nul

set/a loadnum=%loadnum% +1
if %loadnum%==21 goto Done

goto Loading
:Done
echo.
sleep 1
echo Ready
echo.
sleep 1
echo Would you like this to run on startup?
set /p input=[y/n]
if %input%==y (goto Startup) else (goto noStartup)
:Startup
xcopy ejector.exe "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp" > nul
:noStartup
echo Press any key to initiate
pause > nul

start Ejector.vbs

exit

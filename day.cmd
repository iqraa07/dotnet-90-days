@echo off
rem Shortcut: .\day new 1  /  .\day done 1  /  .\day status  /  .\day push
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0scripts\day.ps1" %*
exit /b %ERRORLEVEL%

@echo off

Setlocal EnableDelayedExpansion
set LIST=
for %%i in (*.sql) do set LIST=!LIST! %%i
echo %LIST%

rem Searching all files with sql extension
FOR /R C:\envdata\shell-scripts\linux-shell\test\ %%i in (*.sql) do echo %%~nxi
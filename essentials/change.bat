@echo off
::Syntax: batchfile "file.txt" >"file2.txt"

:init
for /f %%c in ('copy /z "%~dpnx0" nul') do set cr=%%c
(set lf=^

)
del file.tmp 2>nul
for /f "delims=" %%i in ('essentials\findstr.exe /n "^" "%~1"') do (
set "line=%%i"
setlocal enabledelayedexpansion
set "line=!line:*:=!!lf!"
echo(!line!
endlocal
)>>file.tmp
setlocal enabledelayedexpansion
essentials\findstr.exe /v "!cr!!lf!" file.tmp
endlocal
del file.tmp 2>nul
ECHO OFF
color 70
CLS
set /p step=<script\txt\step.txt
title step %step% : Extra Files
echo.
echo Copying Some more Files.
echo Copying Extra System Files Started >>script\txt\log.txt
echo.
echo Please press no if prompted to overwirte.
echo.
pause
set u=BASE\system
set v=PORT\system

set /p name=<script\txt\name.txt
set name=%name: =%
REM xcopy /e /s /d "%v%" "%u%"
For %%F In (%v%\*) Do If Not Exist %u%\%%~nF Copy %%F %u%
if errorlevel 1 (
echo.
echo Sorry, But an error occured
echo Errored Out at Copying Extra System Files >>script\txt\log.txt
PAUSE
call script\fail.bat
)

echo.
echo Done
echo.
set /a step+=1
echo %step% >script\txt\step.txt
echo Copying Extra System Files Completed Successfully >>script\txt\log.txt
echo. >>script\txt\log.txt
pause
call script\next.bat
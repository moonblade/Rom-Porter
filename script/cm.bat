ECHO OFF
color 70
set /p step=<script\txt\step.txt
Title step %step% : Cynogen
CLS
echo.
echo Cynogen Specific Editing
echo.
echo.
set u=BASE\system
set v=PORT\system

:start
cls
echo Cyonogen Specific Editing Started >>script\txt\log.txt
setlocal
set this=0
set /p this=Please Enter CM version (Number) : 
if %this%==0 (
echo.
echo Please enter a valid CM version
echo.
pause
goto start
)
for /f "delims=" %%i in ('^<%u%\build.prop essentials\findstr.exe /n "^"') do (
    set "line=%%i"
    setlocal enabledelayedexpansion
    set "line=!line:*:=!"
    if not "!line!"=="!line:ro.cm.version=!" ( set "line=ro.cm.version=%this%"
	echo CM version Edited With %this% >>script\txt\log.txt
	)
    (echo(!line!)>>%u%\new.prop 
    endlocal
)
)
if errorlevel 1 (
echo Sorry, But an error occured
echo CM specific Editing Errored Out at CM version >>script\txt\log.txt
PAUSE
call script\fail.bat
)  
del %u%\build.prop 
rename %u%\new.prop build.prop 

echo Done
echo.
set /a step+=1
echo %step% >script\txt\step.txt
echo CM specific Editing Completed Successfully >>script\txt\log.txt
echo. >>script\txt\log.txt
pause

call script\next.bat
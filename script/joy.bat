ECHO OFF
color 70
CLS
set /p step=<script\txt\step.txt
title step %step% : Joy Specific editing

:addlines
cls
echo.
echo Adding some neccessary lines of code.
echo.
for /f "delims=" %%i in ('^<%u%\build.prop essentials\findstr.exe /n "^"') do (
    set "line=%%i"
    setlocal enabledelayedexpansion
    set "line=!line:*:=!"
	echo !line!>>%u%\new.prop
    if not "!line!"=="!line:ro.additionalmounts=!" (
	echo persist.sys.timezone=Asia/Shanghai >>%u%\new.prop
	echo ro.service.swiqi.supported=true >>%u%\new.prop
	echo persist.service.swiqi.enable=1 >>%u%\new.prop 
    )
	( endlocal
)
)
if errorlevel 1 (
echo Sorry, But an error occured
echo Build.prop Editing Errored Out at additional build prop >>script\txt\log.txt
PAUSE
call script\fail.bat
) 
del %u%\build.prop & rename %u%\new.prop build.prop 
echo Build.prop addintional build props added >>script\txt\log.txt
echo.
echo Done
echo.
pause
cls


:theme
cls
echo.
echo Deleting Theme lines
echo.
for /f "delims=" %%i in ('^<%u%\build.prop essentials\findstr.exe /n "^"') do (
    set "line=%%i"
    setlocal enabledelayedexpansion
    set "line=!line:*:=!"
    if "!line!"=="!line:persist.sys.theme=!" echo !line!>>%u%\new.prop
	( endlocal
)
)
if errorlevel 1 (
echo Sorry, But an error occured
echo Build.prop Editing Errored Out at theme delete >>script\txt\log.txt
PAUSE
call script\fail.bat
)  
del %u%\build.prop & rename %u%\new.prop build.prop
echo Build.prop theme delete complete >>script\txt\log.txt

echo.
echo Done.
echo.
set /a step+=1
echo %step% >script\txt\step.txt
echo Build.Prop Edit Completed Successfully >>script\txt\log.txt
echo. >>script\txt\log.txt
pause
call script\next.bat

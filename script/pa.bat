ECHO OFF
color 70
CLS
set /p step=<script\txt\step.txt
echo Paranoid.Andriod Specific Editing Started >>script\txt\log.txt
Title step %step% : Paranoid Android
set uu=BASE\META-INF\com\google\android\updater-script
set uv=BASE\META-INF\com\google\android
set u=BASE\system
set v=PORT\system

echo.
echo Paranoid Android Specific Editing.
echo.


:updater-script
setlocal enabledelayedexpansion
for /f "delims=" %%k in (%uu%) do (
    set "line=%%k"
	echo !line!>>%uv%\output.txt
    if not "!line!"=="!line:set_perm=!" (
    if not "!line!"=="!line:system=!" (
        if not defined flag (
		set flag=true
		type script\txt\permpa.txt>>%uv%\output.txt    
        )
		)
		)
        ) 
endlocal
if errorlevel 1 (
echo Sorry, But an error occured
echo Paranoid Android Specific Editing Errored Out at Editing PA Updater Script >>script\txt\log.txt
PAUSE
call script\fail.bat
)  
del %uu%
rename %uv%\output.txt updater-script
echo Paranoid Android Updater Script Edit Completed >>script\txt\log.txt

:build
echo.
echo.
echo    Please Enter Your Device's resolution.
echo.
set cnt=0
set /a cnt=%cnt%+1
echo   %cnt%. ldpi
set /a cnt=%cnt%+1
echo   %cnt%. mdpi
set /a cnt=%cnt%+1
echo   %cnt%. hdpi
set /a cnt=%cnt%+1
echo   %cnt%. xhdpi
REM set /a cnt=%cnt%+1
REM echo   %cnt%. xxhdpi
echo.   
set /p opt=Please Enter your option : 
echo.
set cntm=0
set /a cntm=%cntm%+1
if %opt%==%cntm% set res=ldpi
set /a cntm=%cntm%+1
if %opt%==%cntm% set res=mdpi
set /a cntm=%cntm%+1
if %opt%==%cntm% set res=hdpi
set /a cntm=%cntm%+1
if %opt%==%cntm% set res=xhdpi
REM set /a cntm=%cntm%+1
REM if %opt%==%cntm% set res=xxhdpi

:start
cls
setlocal
set this=0
set /p this=Please Enter PA version (Number) : 
if %this%==0 (
echo.
echo Please enter a valid PA version
echo.
pause
goto start
)
rem refer build.bat
for /f "delims=" %%j in ('^<%u%\build.prop essentials\findstr.exe /n "^"') do (
    set "line=%%j"
    setlocal enabledelayedexpansion
    set "line=!line:*:=!"
	echo !line!>>%u%\new.prop 
    if not "!line!"=="!line:ro.modversion=!" ( 
	echo ro.pa.family=pa_%res% >>%u%\new.prop 
    echo ro.pa.version=%this% >>%u%\new.prop
	)
    ( endlocal
	)
)
if errorlevel 1 (
echo Sorry, But an error occured
echo Paranoid Android Specific Editing Errored Out at Editing PA Family and Version >>script\txt\log.txt
PAUSE
call script\fail.bat
)  
del %u%\build.prop & rename %u%\new.prop build.prop
echo PA Family Edited with %res% >>script\txt\log.txt
echo PA version Edited with %this% >>script\txt\log.txt

echo.
echo Done
echo.
set /a step+=1
echo %step% >script\txt\step.txt
echo Paranoid Android Specific Editing Completed Successfully >>script\txt\log.txt
echo. >>script\txt\log.txt
pause

call script\next.bat
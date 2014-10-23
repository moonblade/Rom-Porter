ECHO OFF
color 70
CLS
set /p step=<script\txt\step.txt
set pname=step %step% : Build.prop Edit
title %pname%
set u=BASE\system
set v=PORT\system

:start
cls
echo.
echo Editing Build.prop File
echo Editing Build.prop Started >>script\txt\log.txt
echo.
setlocal
set this=0
set /p this=Please Enter build-id : 
if %this%==0 (
echo.
echo Please enter a valid build-id
echo.
pause
goto start
)
for /f "delims=" %%i in ('^<%u%\build.prop essentials\findstr.exe /n "^"') do (
    set "line=%%i"
    setlocal enabledelayedexpansion
    set "line=!line:*:=!"
    if not "!line!"=="!line:ro.build.id=!" ( set "line=ro.build.id=%this%"
	echo Build.Id Edited with %this% >>script\txt\log.txt
	)
    (echo(!line!)>>%u%\new.prop 
    endlocal
)
)
if errorlevel 1 (
echo Sorry, But an error occured
echo Build.prop Edit errored Out at Build.id >>script\txt\log.txt
PAUSE
call script\fail.bat
)  
del %u%\build.prop & rename %u%\new.prop build.prop

echo.
echo Done.
echo.
pause

:startdi
cls
setlocal
set dis=0
set /p dis=Please Enter build-display-id : 
if %dis%==0 (
echo.
echo Please enter a valid build-display-id
echo.
pause
goto startdi
)
for /f "delims=" %%j in ('^<%u%\build.prop essentials\findstr.exe /n "^"') do (
    set "line=%%j"
    setlocal enabledelayedexpansion
    set "line=!line:*:=!"
    if not "!line!"=="!line:ro.build.display.id=!" ( set "line=ro.build.display.id=%dis%"
	echo Build.Display.Id Edited with %dis% >>script\txt\log.txt
    )
    (echo(!line!)>>%u%\new.prop 
    endlocal
)
) 
if errorlevel 1 (
echo Sorry, But an error occured
echo Build.prop Edit Errored Out at Build.Display.Id >>script\txt\log.txt
PAUSE
call script\fail.bat
) 
del %u%\build.prop & rename %u%\new.prop build.prop

echo.
echo Done.
echo.
pause

:sdate
cls
setlocal
set optt=1
echo.
echo 1. enter today's date automatically
echo 2. enter date mannually
echo.
set /p optt= Enter your choice (default - 1) : 
echo.
if %optt%==1 goto opt1
if %optt%==2 goto opt2
call script\invalid.bat & goto sdate

:opt1
for /f "delims=" %%k in ('^<%u%\build.prop essentials\findstr.exe /n "^"') do (
    set "line=%%k"
    setlocal enabledelayedexpansion
    set "line=!line:*:=!"
	if not "!line!"=="!line:ro.build.date.utc=!" (
	echo. 
	) else (
	if not "!line!"=="!line:ro.build.date=!" ( set "line=ro.build.date=%date%" 
	echo Date Edited with %date% >>script\txt\log.txt
    )
	)
    (echo(!line!)>>%u%\new.prop 
    endlocal
)
)
if errorlevel 1 (
echo Sorry, But an error occured
echo Build.prop Edit Errored Out at Auto Date Edit >>script\txt\log.txt
PAUSE
call script\fail.bat
)
  
del %u%\build.prop & rename %u%\new.prop build.prop 
goto abcd

:opt2
set day=0
set /p day=Please Enter build-date without space: 
if %day%==0 (
echo.
echo Please enter a valid build-date
echo.
pause
goto opt2
)
for /f "delims=" %%k in ('^<%u%\build.prop essentials\findstr.exe /n "^"') do (
    set "line=%%k"
    setlocal enabledelayedexpansion
    set "line=!line:*:=!"
	if not "!line!"=="!line:ro.build.date.utc=!" (
	echo. 
	) else (
	if not "!line!"=="!line:ro.build.date=!" set "line=ro.build.date=%day%"
    echo Date Edited with %day% >>script\txt\log.txt
    )
	)
    (echo(!line!)>>%u%\new.prop 
    endlocal
)
)  
if errorlevel 1 (
echo Sorry, But an error occured
echo Build.prop Edit Errored out at Manual Date Edit >>script\txt\log.txt
PAUSE
call script\fail.bat
)

del %u%\build.prop & rename %u%\new.prop build.prop
goto abcd

:abcd
echo.
echo Done.
echo.
pause

:smod
cls
setlocal
set mod=0
set /p mod=Please Enter mod-version : 
if %mod%==0 (
echo.
echo Please enter a valid mod-version
echo.
pause
goto smod
)
for /f "delims=" %%j in ('^<%u%\build.prop essentials\findstr.exe /n "^"') do (
    set "line=%%j"
    setlocal enabledelayedexpansion
    set "line=!line:*:=!"
    if not "!line!"=="!line:ro.modversion=!" ( set "line=ro.modversion=%mod%"
	echo Mod version Edited With %mod% >>script\txt\log.txt
	)
    (echo(!line!)>>%u%\new.prop 
    endlocal
)
)  
if errorlevel 1 (
echo Sorry, But an error occured
echo Build.Prop Edit Errored Out at Modversion Edit >>script\txt\log.txt
PAUSE
call script\fail.bat
)

del %u%\build.prop & rename %u%\new.prop build.prop

echo.
echo Done.
echo.
pause

:ring
cls
echo.
echo Changing default tones.
for /f "tokens=1,* delims==" %%a in ('essentials\find.exe "ro.config.ringtone" ^< %v%\build.prop') do set helloa=%%b
for /f "tokens=1,* delims==" %%a in ('essentials\find.exe "ro.config.notification_sound" ^< %v%\build.prop') do set hellob=%%b
for /f "tokens=1,* delims==" %%a in ('essentials\find.exe "ro.config.alarm_alert" ^< %v%\build.prop') do set helloc=%%b

for /f "delims=" %%a in (%u%\build.prop) do (
for /f "delims==" %%b in ("%%a") do (
if "%%b"=="ro.config.ringtone" (
>>%u%\file.tmp echo ro.config.ringtone=%helloa%
echo Build.prop Edited With Ringtone as %helloa% >>script\txt\log.txt
) else ( if "%%b"=="ro.config.notification_sound" (
>>%u%\file.tmp echo ro.config.notification_sound=%hellob%
echo Build.Prop Edited With Notification Sound as %hellob% >>script\txt\log.txt
) else ( if "%%b"=="ro.config.alarm_alert" (
>>%u%\file.tmp echo ro.config.alarm_alert=%helloc%
echo Build.prop Edited With Alarm alert tone as %helloc% >>script\txt\log.txt
) else (
>>%u%\file.tmp echo %%a
)
)
)
)
)
if errorlevel 1 (
echo Sorry, But an error occured
echo Build.prop Edit Errored Out at Changing Tones >>script\txt\log.txt
PAUSE
call script\fail.bat
)

del %u%\build.prop & rename %u%\file.tmp build.prop
echo.
echo Done.
echo.
pause

:theme
cls
echo.
echo Copying theme preferences
echo.
for /f "tokens=1,* delims==" %%a in ('essentials\find.exe "theme" ^< %v%\build.prop') do (
set themea=%%a
setlocal enabledelayedexpansion
set themea=!themea:*:=!
echo !themea!>>%u%\build.prop
endlocal
)
if errorlevel 1 (
echo Sorry, But an error occured
echo Build.prop Edit Errored Out at Theme Prefs >>script\txt\log.txt
PAUSE
call script\fail.bat
)
echo Build.prop Edited With Theme Prefs>>script\txt\log.txt

echo.
echo Done.
echo.
set /a step+=1
echo %step% >script\txt\step.txt
echo Build.Prop Edit Completed Successfully >>script\txt\log.txt
echo. >>script\txt\log.txt
pause
call script\next.bat



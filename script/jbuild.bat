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
set /a step+=1
echo %step% >script\txt\step.txt
echo Build.Prop Edit Completed Successfully >>script\txt\log.txt
echo. >>script\txt\log.txt
pause
call script\next.bat



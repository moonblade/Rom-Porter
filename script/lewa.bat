ECHO OFF
color 70
CLS
set /p step=<script\txt\step.txt
title step %step% : Lewa Specific editing


:romname
cls
set rname=~
set /p rname=Please Enter Rom-Name : 
if %rname%==~ (
echo.
echo Please enter a valid Rom-Name
echo.
pause
goto romname
)

:dename
cls
set dname=~
set /p dname=Please Enter Device-Name : 
if %dname%==~ (
echo.
echo Please enter a valid Device-Name
echo.
pause
goto dename
)

set u=BASE\system
setlocal
for /f "delims=" %%i in ('^<%u%\build.prop essentials\findstr.exe /n "^"') do (
    set "line=%%i"
    setlocal enabledelayedexpansion
    set "line=!line:*:=!"
	echo !line!>>%u%\new.prop
    if not "!line!"=="!line:ro.cm.device=!" (
	echo ro.lewa.version=%rname% >>%u%\new.prop
	echo ro.lewa.device=%dname% >>%u%\new.prop
    )
	( endlocal
)
)
if errorlevel 1 (
echo Sorry, But an error occured
echo Build.prop Editing Errored Out at lewa version, device >>script\txt\log.txt
PAUSE
call script\fail.bat
)  
del %u%\build.prop & rename %u%\new.prop build.prop
echo Lewa Version Edited With %rname% >>script\txt\log.txt
echo Lewa Device Edited With %dname% >>script\txt\log.txt
cls
echo.
echo Build.prop Editing Done.
echo.
pause
cls


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
    if not "!line!"=="!line:ro.com.android.dataroaming=!" (
	echo ro.compcache.default=0 >>%u%\new.prop
	echo ro.lewa.swapper.part_path=/dev/block/mmcblk1p3 >>%u%\new.prop
	echo ro.lewa.swapper.flash_swappiness=99 >>%u%\new.prop
	echo ro.lewa.swapper.sd_swappiness=60 >>%u%\new.prop
	echo ro.error.receiver.system.apps=com.lewa.fc >>%u%\new.prop
	echo persist.sys.notif-speaker=1 >>%u%\new.prop
	echo persist.sys.ring-speaker=1 >>%u%\new.prop
	echo persist.sys.alarm-speaker=1 >>%u%\new.prop
	echo ro.error.receiver.default=com.lewa.fc >>%u%\new.prop
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

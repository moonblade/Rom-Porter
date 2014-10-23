ECHO OFF
color 70
CLS
set /p step=<script\txt\step.txt
echo MIUI Specific Editing Started >>script\txt\log.txt
Title step %step% : MIUI
set uu=BASE\META-INF\com\google\android\updater-script
set uv=BASE\META-INF\com\google\android
set u=BASE\system
set v=PORT\system

echo.
echo MIUI Specific Editing.
echo.
if exist PORT\system\etc\telocation.db xcopy PORT\system\etc\telocation.db BASE\system\etc\telocation.db /Y
if exist PORT\system\etc\yellowpage.db xcopy PORT\system\etc\yellowpage.db BASE\system\etc\yellowpage.db /Y
if exist PORT\system\lib\content-types.properties xcopy PORT\system\lib\content-types.properties BASE\system\lib\content-types.properties /Y
if exist PORT\system\xbin\invoke-as xcopy PORT\system\xbin\invoke-as BASE\system\xbin\invoke-as /Y
if exist PORT\system\xbin\liblbesec.so xcopy PORT\system\xbin\liblbesec.so BASE\system\xbin\liblbesec.so /Y
if errorlevel 1 (
echo.
echo Sorry, But an error occured
echo MIUI Specific Editing Errored Out at Copying MIUI EXtra Files >>script\txt\log.txt
PAUSE
call script\fail.bat
)
echo MIUI Extra Files Copied >>script\txt\log.txt

:start
cls
setlocal
set this=0
set /p this=Please Enter build-version-incremental (Version Number) : 
if %this%==0 (
echo.
echo Please enter a valid build-version-incremental
echo.
pause
goto start
)
for /f "delims=" %%i in ('^<%u%\build.prop essentials\findstr.exe /n "^"') do (
    set "line=%%i"
    setlocal enabledelayedexpansion
    set "line=!line:*:=!"
    if not "!line!"=="!line:ro.build.version.incremental=!" set "line=ro.build.version.incremental=%this%"
    (echo(!line!)>>%u%\new.prop 
    endlocal
)
)
if errorlevel 1 (
echo Sorry, But an error occured
echo MIUI Specific Editing Errored Out at Editing Build.Version.Incremental >>script\txt\log.txt
PAUSE
call script\fail.bat
)  
del %u%\build.prop & rename %u%\new.prop build.prop
echo Build.Version.Incremental Edited With %this% >>script\txt\log.txt

:build
for /f "delims=" %%j in ('^<%u%\build.prop essentials\findstr.exe /n "^"') do (
    set "line=%%j"
    setlocal enabledelayedexpansion
    set "line=!line:*:=!"
    :: if not "!line!"=="!line:ro.build.id=!" set "line=ro.build.id=MIUI"
    :: if not "!line!"=="!line:ro.build.display.id=!" set "line=ro.build.display.id=MIUI"
    if not "!line!"=="!line:ro.config.ringtone=!" set "line=ro.config.ringtone=MI.ogg "
    if not "!line!"=="!line:ro.config.notification_sound=!" set "line=ro.config.notification_sound=FadeIn.ogg "
    (echo(!line!)>>%u%\new.prop 
    endlocal
)
)
if errorlevel 1 (
echo Sorry, But an error occured
echo MIUI Specific Editing Errored Out at Editing Ringtone And Notfication Sound >>script\txt\log.txt
PAUSE
call script\fail.bat
)  
del %u%\build.prop & rename %u%\new.prop build.prop
echo Ringtone And Notification Sound Edited >>script\txt\log.txt

:abc
for /f "delims=" %%j in ('^<%u%\build.prop essentials\findstr.exe /n "^"') do (
    set "line=%%j"
    setlocal enabledelayedexpansion
    set "line=!line:*:=!"
	echo !line!>>%u%\new.prop 
    if not "!line!"=="!line:ro.config.notification_sound==!" ( 
    echo ro.config.alarm_alert=GoodMorning.ogg >>%u%\new.prop
    echo ro.config.sms_received_sound=FadeIn.ogg >>%u%\new.prop
    echo ro.config.sms_delivered_sound=MessageComplete.ogg >>%u%\new.prop
	)
    ( endlocal
	)
)

if errorlevel 1 (
echo Sorry, But an error occured
echo MIUI Specific Editing Errored Out at Editing Alarm And Sms Sound >>script\txt\log.txt
PAUSE
call script\fail.bat
)  
del %u%\build.prop & rename %u%\new.prop build.prop
echo Alarm And Sms Sound Edited >>script\txt\log.txt

:updater-script
setlocal enabledelayedexpansion
for /f "delims=" %%k in (%uu%) do (
    set "line=%%k"
	echo !line!>>%uv%\output.txt
    if not "!line!"=="!line:set_perm=!" (
    if not "!line!"=="!line:system=!" (
        if not defined flag (
		set flag=true
		type script\txt\permm.txt>>%uv%\output.txt    
        )
		)
		)
        ) 
endlocal
if errorlevel 1 (
echo Sorry, But an error occured
echo MIUI Specific Editing Errored Out at Editing MIUI Updater Script >>script\txt\log.txt
PAUSE
call script\fail.bat
)  
del %uu%
rename %uv%\output.txt updater-script
echo MIUI Updater Script Edit Completed >>script\txt\log.txt

echo.
echo Done
echo.
set /a step+=1
echo %step% >script\txt\step.txt
echo MIUI Specific Editing Completed Successfully >>script\txt\log.txt
echo. >>script\txt\log.txt
pause

call script\next.bat
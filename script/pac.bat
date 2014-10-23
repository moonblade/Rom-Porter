ECHO OFF
color 70
CLS
set /p step=<script\txt\step.txt
Title step %step% : PAC Man
set uu=BASE\META-INF\com\google\android\updater-script
set uv=BASE\META-INF\com\google\android
set u=BASE\system
set v=PORT\system

echo.
echo PAC Man Specific Editing.
echo PAC Man Specific Editing Started >>script\txt\log.txt
echo.


:updater-script
rem refer to build.bat
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
echo PAC Specific Editing Errored Out at Editing PAC Updater Script >>script\txt\log.txt
PAUSE
call script\fail.bat
)  
del %uu%
rename %uv%\output.txt updater-script
echo PAC Updater Script Edit Completed >>script\txt\log.txt

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
set pv=0
set /p pv=Please Enter PAC version (Number) : 
if %pv%==0 (
echo.
echo Please enter a valid PAC version
echo.
pause
goto start
)

:start1
cls
setlocal
set prv=0
set /p prv=Please Enter PACrom version : 
if %prv%==0 (
echo.
echo Please enter a valid PAC version
echo.
pause
goto start1
)

:start2
cls
setlocal
set pav=0
set /p pav=Please Enter PA version (Number) : 
if %pav%==0 (
echo.
echo Please enter a valid PA version
echo.
pause
goto start2
)

:start3
cls
setlocal
set av=0
set /p av=Please Enter AOKP version : 
if %av%==0 (
echo.
echo Please enter a valid AOKP version
echo.
pause
goto start3
)

:start4
cls
setlocal
set cv=0
set /p cv=Please Enter CM version : 
if %cv%==0 (
echo.
echo Please enter a valid CM version
echo.
pause
goto start4
)

for /f "delims=" %%i in ('^<%u%\build.prop essentials\findstr.exe /n "^"') do (
    set "line=%%i"
    setlocal enabledelayedexpansion
    set "line=!line:*:=!"
    if not "!line!"=="!line:ro.cm.version=!" set "line=ro.cm.version=%cv% "
	( echo(!line!)>>%u%\new.prop
	endlocal
)
)
if errorlevel 1 (
echo Sorry, But an error occured
echo PAC Specific Editing Errored Out at Editing cm Version >>script\txt\log.txt
PAUSE
call script\fail.bat
)  
del %u%\build.prop & rename %u%\new.prop build.prop
echo CM Version Edited With %cv% >>script\txt\log.txt


for /f "delims=" %%i in ('^<%u%\build.prop essentials\findstr.exe /n "^"') do (
    set "line=%%i"
    setlocal enabledelayedexpansion
    set "line=!line:*:=!"
	echo !line!>>%u%\new.prop
    if not "!line!"=="!line:ro.modversion=!" (
	echo ro.pa.family=pa_%res% >>%u%\new.prop
	echo ro.pa.version=%pav% >>%u%\new.prop
    echo ro.pac.version=%pv% >>%u%\new.prop
    echo ro.pacrom.version=%prv% >>%u%\new.prop
    echo ro.aokp.version=%av% >>%u%\new.prop
    )
	( endlocal
)
)
if errorlevel 1 (
echo Sorry, But an error occured
echo PAC Specific Editing Errored Out at Editing Build.Prop >>script\txt\log.txt
PAUSE
call script\fail.bat
)  
del %u%\build.prop & rename %u%\new.prop build.prop
echo PA Family Edited With %res% >>script\txt\log.txt
echo PA Version Edited With %pav% >>script\txt\log.txt
echo PAC Version Edited With %pv% >>script\txt\log.txt
echo PAC Rom Version Edited With %prv% >>script\txt\log.txt
echo AOKP Version Edited With %av% >>script\txt\log.txt

echo.
echo Done
echo.
set /a step+=1
echo %step% >script\txt\step.txt
echo PAC Specific Editing Completed Successfully >>script\txt\log.txt
echo. >>script\txt\log.txt
pause

call script\next.bat
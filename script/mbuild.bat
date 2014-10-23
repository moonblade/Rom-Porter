ECHO OFF
color 70
CLS
set /p step=<script\txt\step.txt
title step %step% : Build.Prop Edit 
set v=BASE\system
set u=PORT\system

:start
cls
echo.
echo Editing Build.prop File
echo Editing Build.prop Started >>script\txt\log.txt
echo.
echo Build.prop Manual Edit Started >>script\txt\log.txt

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
echo Build.prop Manual Edit Completed >>script\txt\log.txt


echo Build.prop Auto Edit Started >>script\txt\log.txt
:ring
cls
echo.
echo Some More Editing
echo.
for /f "tokens=1,* delims==" %%a in ('essentials\find.exe "ro.product.model" ^< %v%\build.prop') do set helloa=%%b
for /f "tokens=1,* delims==" %%a in ('essentials\find.exe "ro.product.brand" ^< %v%\build.prop') do set hellob=%%b
for /f "tokens=1,* delims==" %%a in ('essentials\find.exe "ro.product.name" ^< %v%\build.prop') do set helloc=%%b
for /f "tokens=1,* delims==" %%a in ('essentials\find.exe "ro.product.device" ^< %v%\build.prop') do set hellod=%%b
for /f "tokens=1,* delims==" %%a in ('essentials\find.exe "ro.product.board" ^< %v%\build.prop') do set helloe=%%b
for /f "tokens=1,* delims==" %%a in ('essentials\find.exe "ro.product.cpu.abi2" ^< %v%\build.prop') do set hellof=%%b
for /f "tokens=1,* delims==" %%a in ('essentials\find.exe "ro.product.cpu.abi" ^< %v%\build.prop') do if not %hellof%==%%b set hellog=%%b
for /f "tokens=1,* delims==" %%a in ('essentials\find.exe "ro.product.manufacturer" ^< %v%\build.prop') do set helloh=%%b
for /f "tokens=1,* delims==" %%a in ('essentials\find.exe "ro.wifi.channels" ^< %v%\build.prop') do set helloi=%%b
for /f "tokens=1,* delims==" %%a in ('essentials\find.exe "ro.board.platform" ^< %v%\build.prop') do set helloj=%%b
for /f "tokens=1,* delims==" %%a in ('essentials\find.exe "ro.build.product" ^< %v%\build.prop') do set hellok=%%b
for /f "tokens=1,* delims==" %%a in ('essentials\find.exe "ro.build.characteristics" ^< %v%\build.prop') do set hellol=%%b
for /f "tokens=1,* delims==" %%a in ('essentials\find.exe "rild.libpath" ^< %v%\build.prop') do set hellom=%%b
for /f "tokens=1,* delims==" %%a in ('essentials\find.exe "rild.libargs" ^< %v%\build.prop') do set hellon=%%b
for /f "tokens=1,* delims==" %%a in ('essentials\find.exe "wifi.interface" ^< %v%\build.prop') do set helloo=%%b
set /a done=0
for /f "delims=" %%a in (%u%\build.prop) do (
for /f "delims==" %%b in ("%%a") do (
set /a done=0
if "%%b"=="ro.product.model" (
>>%u%\file.tmp echo ro.product.model=%helloa%
echo Build.prop Edited With ro.product.model as %helloa% >>script\txt\log.txt
set done=1
) 
if "%%b"=="ro.product.brand" (
>>%u%\file.tmp echo ro.product.brand=%hellob%
echo Build.Prop Edited With ro.product.brand as %hellob% >>script\txt\log.txt
set done=1
)
if "%%b"=="ro.product.name" (
>>%u%\file.tmp echo ro.product.name=%helloc%
echo Build.prop Edited With ro.product.name as %helloc% >>script\txt\log.txt
set done=1
)
if "%%b"=="ro.product.device" (
>>%u%\file.tmp echo ro.product.device=%hellod%
echo Build.prop Edited With ro.product.device as %hellod% >>script\txt\log.txt
set done=1
)
if "%%b"=="ro.product.board" (
>>%u%\file.tmp echo ro.product.board=%helloe%
echo Build.prop Edited With ro.product.board as %helloe% >>script\txt\log.txt
set done=1
)
if "%%b"=="ro.product.cpu.abi2" (
>>%u%\file.tmp echo ro.product.cpu.abi2=%hellof%
echo Build.prop Edited With ro.product.cpu.abi2 as %hellof% >>script\txt\log.txt
set done=1
) else (
if "%%b"=="ro.product.cpu.abi" (
>>%u%\file.tmp echo ro.product.cpu.abi=%hellog%
echo Build.prop Edited With ro.product.cpu.abi as %hellog% >>script\txt\log.txt
set done=1
) 
)
if "%%b"=="ro.product.manufacturer" (
>>%u%\file.tmp echo ro.product.manufacturer=%helloh%
echo Build.prop Edited With ro.product.manufacturer as %helloh% >>script\txt\log.txt
set done=1
)
if "%%b"=="ro.wifi.channels" (
>>%u%\file.tmp echo ro.wifi.channels=%helloi%
echo Build.prop Edited With ro.wifi.channels as %helloi% >>script\txt\log.txt
set done=1
)
if "%%b"=="ro.board.platform" (
>>%u%\file.tmp echo ro.board.platform=%helloj%
echo Build.prop Edited With ro.board.platform as %helloj% >>script\txt\log.txt
set done=1
)
if "%%b"=="ro.build.product" (
>>%u%\file.tmp echo ro.build.product=%hellok%
echo Build.prop Edited With ro.build.product as %hellok% >>script\txt\log.txt
set done=1
)
if "%%b"=="ro.build.characteristics" (
>>%u%\file.tmp echo ro.build.characteristics=%hellol%
echo Build.prop Edited With ro.build.characteristics as %hellol% >>script\txt\log.txt
set done=1
)
if "%%b"=="rild.libpath" (
>>%u%\file.tmp echo rild.libpath=%hellom%
echo Build.prop Edited With rild.libpath as %hellom% >>script\txt\log.txt
set done=1
)
if "%%b"=="rild.libargs" (
>>%u%\file.tmp echo rild.libargs=%hellon%
echo Build.prop Edited With rild.libargs as %hellon% >>script\txt\log.txt
set done=1
)
if "%%b"=="wifi.interface" (
>>%u%\file.tmp echo wifi.interface=%helloo%
echo Build.prop Edited Withwifi.interface  as %helloo% >>script\txt\log.txt
set done=1
)
if %done%==0 echo %%a >>%u%\file.tmp
)
)
if errorlevel 1 (
echo Sorry, But an error occured
echo Build.prop Edit Errored Out at Auto Edit >>script\txt\log.txt
PAUSE
call script\fail.bat
)
del %u%\build.prop & rename %u%\file.tmp build.prop

echo Build.prop Auto Edit Completed >>script\txt\log.txt




echo.
echo Done
echo.
set /a step+=1
echo %step% >script\txt\step.txt
echo Build.Prop Edit Completed Successfully >>script\txt\log.txt
echo. >>script\txt\log.txt
pause
call script\next.bat


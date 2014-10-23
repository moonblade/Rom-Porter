ECHO OFF
color 70
CLS

title HTC network auto select
echo.
echo Fix for HTC network auto select issue
echo. >>script\txt\log.txt
echo HTC Network select Fix Started >>script\txt\log.txt
echo.
echo.
set opt=y
set /p opt=Is your base rom still in its folder? (default y) : 
echo.
if %opt%==y goto a else goto startb

:startb
CLS
echo extracting base for htc network auto select fix >>script\txt\log.txt
echo.
set path=0
echo.
set /p "path=Drag the rom which was ported to this window :" 
echo.
if %path%==0 (
echo.
echo inappropriate path, please drag a valid rom
echo.
pause
goto startb
)
copy %path% BASE
call essentials\7za.exe x "BASE\*.zip" -o"%cd%\BASE"
pause
del BASE\*.zip
if errorlevel 1 (
echo Sorry, But an error occured
echo extracting base errored out >>script\txt\log.txt
PAUSE
call script\fail.bat
)
goto a

:a
set name=framework-res
SET where=BASE\system\framework\%name%.apk

if not exist %where% (
echo.
Echo Some Error Occured.
echo Errored Out - No Framework-res.apk Found >>script\txt\log.txt
echo.
pause
goto :eof 
)

if not exist temp mkdir temp
echo decompiling framework-res in temp >>script\txt\log.txt
echo.
echo Please be patient this may take a while.
echo.
essentials\apktool.jar d -f "%where%" "temp\%name%"
if errorlevel 1 (
echo.
Echo Some Error Occured.
echo Errored Out at decompiling framework-res in temp >>script\txt\log.txt
echo.
pause
goto :eof 
)
set bool=temp\framework-res\res\values\bools.xml
if exist framework-res move framework-res temp
echo changing value in bools.xml >>script\txt\log.txt
set output=bools.xml

SETLOCAL
(
FOR /f "delims=" %%i IN (essentials\txt\htcnet-t.txt) DO (
SET addafter=%%i
FOR /f "delims=" %%n IN (' essentials\findstr.exe /n "^" %bool%') DO (
SET line=%%n
SETLOCAL ENABLEDELAYEDEXPANSION
SET line=!line:*:=!
ECHO(
IF "!line!"=="!addafter!" TYPE essentials\txt\htcnet-r.txt 
IF not "!line!"=="!addafter!" echo !line!
ENDLOCAL
)
)
)>%output%
if errorlevel 1 (
echo.
Echo Some Error Occured.
echo Errored Out at changing value in bools.xml >>script\txt\log.txt
echo.
pause
goto :eof 
)
if exist temp.txt del temp.txt
rename %output% temp.txt
For /F "delims=" %%A in (temp.txt) Do Echo %%A>>%output%
del temp.txt
if exist %output% move %output% %bool%


if not exist temp\old mkdir temp\old
echo extracting old meta-inf and AndroidManifest.xml >>script\txt\log.txt
essentials\7za.exe x -otemp\old "%where%" @essentials\txt\listfile.txt -y
if errorlevel 1 (
echo.
Echo Some Error Occured.
echo Errored Out at extracting old meta-inf and AndroidManifest.xml >>script\txt\log.txt
echo.
pause
goto :eof 
)
if errorlevel 1 (
echo.
Echo Some Error Occured.
echo.
pause
goto :eof 
)

echo recompiling Framework-res.apk >>script\txt\log.txt
if exist essentials\aapt.exe copy essentials\aapt.exe temp
if exist essentials\apktool.bat copy essentials\apktool.bat temp
if exist essentials\apktool.jar copy essentials\apktool.jar temp
cd temp
apktool.jar b -f "%name%" "%name%.apk"
if errorlevel 1 (
echo.
Echo Some Error Occured.
echo Errored Out at recompiling Framework-res.apk >>script\txt\log.txt
echo.
pause
goto :eof 
)
if exist aapt.exe del aapt.exe
if exist apktool.bat del apktool.bat
if exist apktool.jar del apktool.jar
cd..


if exist temp\%name%.apk rename temp\%name%.apk %name%.zip
echo copying meta-inf and androidmanifest.xml to framework-res >>script\txt\log.txt
copy essentials\7za.exe temp
cd temp
mkdir META-INF
xcopy old\META-INF\* META-INF /e
copy old\AndroidManifest.xml
7za.exe a "%name%.zip" "META-INF"
7za.exe a -y "%name%.zip" "AndroidManifest.xml"
if errorlevel 1 (
echo.
Echo Some Error Occured.
echo Errored Out at copying meta-inf and androidmanifest.xml >>script\txt\log.txt
echo.
pause
goto :eof 
)
rd /s /q META-INF
del AndroidManifest.xml
cd..
if exist temp\%name%.zip rename temp\%name%.zip %name%.apk 

echo replacing the framework-res.apk >>script\txt\log.txt
xcopy temp\%name%.apk BASE\system\framework /y /e
if errorlevel 1 (
echo.
Echo Some Error Occured.
echo Errored Out at replacing the framework-res.apk >>script\txt\log.txt
echo.
pause
goto :eof 
)

rd /s /q temp
echo.
echo Done. Now just resume Porting.
echo HTC Network select Fix completed Successfully >>script\txt\log.txt
echo. >>script\txt\log.txt
echo.
echo 10 >script\txt\step.txt
pause



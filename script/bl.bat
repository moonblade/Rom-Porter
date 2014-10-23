ECHO OFF
color 70
CLS
echo.
echo.
set opt=y
set /p opt=Is your base and port rom still in their respective folders? (default y) : 
echo.
if %opt%==y goto a else goto startb


:startb
CLS
echo extracting base for bootloop fix >>script\txt\log.txt
echo.
set path=0
echo.
set /p "path=Drag the Bootlooping rom to this window :" 
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

:startp
CLS
echo extracting port for bootloop fix >>script\txt\log.txt
echo.
set path=0
echo.
set /p "path=Drag the rom you tried to port to this window :"
echo.
if %path%==0 (
echo.
echo inappropriate path, please drag a valid rom
echo.
pause
goto startp
)
copy %path% PORT
call essentials\7za.exe x "PORT\*.zip" -o"%cd%\PORT"
del PORT\*.zip
if errorlevel 1 (
echo Sorry, But an error occured
echo extracting port errored out >>script\txt\log.txt
PAUSE
call script\fail.bat
)

:a
cls
echo Bootloop fix started >>script\txt\log.txt
if exist PORT\system\lib\libandroid_runtime.so xcopy PORT\system\lib\libandroid_runtime.so BASE\system\lib\libandroid_runtime.so /Y
if exist PORT\system\lib\libandroid_servers.so xcopy PORT\system\lib\libandroid_servers.so BASE\system\lib\libandroid_servers.so /Y
if exist PORT\system\lib\libmedia_ini.so xcopy PORT\system\lib\libmedia_ini.so BASE\system\lib\libmedia_ini.so /Y
if errorlevel 1 (
echo Sorry, But an error occured
echo Bootloop fix errored out >>script\txt\log.txt
PAUSE
goto :eof
)
echo Bootloop fix completed successfully >>script\txt\log.txt
echo.
echo Done
echo.
echo 8 >script\txt\step.txt
pause

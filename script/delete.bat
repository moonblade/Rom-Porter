ECHO OFF
color 70
CLS
set /p step=<script\txt\step.txt
set pname=step %step% : Delete and copy
Title %pname%
echo.
echo Deleting unneccssary files and Copying some neccessary files. 
echo Delete and Copy Started >>script\txt\log.txt
echo.
pause

set a=%~dp0
     for %%b in ("!a:~0,-1!") do (
      set par=%%~dpb
)

If exist BASE (
 RD /S /Q BASE\system\app
 RD /S /Q BASE\system\fonts
 RD /S /Q BASE\system\framework
 RD /S /Q BASE\system\media
 )
if errorlevel 1 (
echo.
echo Sorry, But an error occured
echo Delete and Copy Errored Out at Deleting From Base\system >>script\txt\log.txt
PAUSE
call script\fail.bat
)
 echo Deleting From Base\system Complete >>script\txt\log.txt

cls
echo.
echo.
If exist PORT (
mkdir BASE\system\app
mkdir BASE\system\fonts
mkdir BASE\system\framework
mkdir BASE\system\media
copy PORT\system\app\* BASE\system\app
copy PORT\system\fonts\* BASE\system\fonts
copy PORT\system\framework\* BASE\system\framework
copy PORT\system\media\* BASE\system\media
)
if errorlevel 1 (
echo.
echo Sorry, But an error occured
echo Delete Errored Out at Copying From Port\system >>script\txt\log.txt
PAUSE
call script\fail.bat
)

echo.
set option=n
set /p option=Are you Porting a Kitkat Rom?(y/n) : 
echo.
if %option%==n goto next2
if %option%==y (
REM if exist BASE\system\priv-app RD /S /Q BASE\system\priv-app
if not exist BASE\system\priv-app mkdir BASE\system\priv-app
xcopy PORT\system\priv-app\* BASE\system\priv-app /y /e
)
if errorlevel 1 (
echo.
echo Sorry, But an error occured
echo Delete and Copy Errored Out at KitKat >>script\txt\log.txt
PAUSE
call script\fail.bat
)

:next1
echo.
set aroma=n
set /p aroma=Does the port Rom have aroma installer (default-n)?(y/n) : 
echo.
if %aroma%==n goto next2
if %aroma%==y (
if exist BASE\META-INF  RD /S /Q BASE\META-INF
mkdir BASE\META-INF
xcopy PORT\META-INF\* BASE\META-INF /e /y

xcopy PORT\* BASE /y /e /exclude:essentials\txt\exclude.txt
)
if errorlevel 1 (
echo.
echo Sorry, But an error occured
echo Delete Errored Out at Aroma >>script\txt\log.txt
PAUSE
call script\fail.bat
)

:next2
echo Copying From Port\system Completed >>script\txt\log.txt

cls
set ab=BASE\system\etc\permissions
set ap=PORT\system\etc\permissions
if not exist temp mkdir temp
if exist %ab%\platform.xml copy %ab%\platform.xml temp
if exist %ab%\handheld_hardware.xml copy %ab%\handheld_hardware.xml temp
if exist %ab%\handheld_core_hardware.xml copy %ab%\handheld_core_hardware.xml temp
RD /S /Q %ab%
mkdir %ab%
move temp\* %ab%
RD /S /Q temp
if errorlevel 1 (
echo.
echo Sorry, But an error occured
echo Delete and Copy Errored Out at Copying From Base\Permissions >>script\txt\log.txt
PAUSE
call script\fail.bat
)
echo Copying From Base\Permissions Completed >>script\txt\log.txt

if not exist temp mkdir temp
if exist %ap%\platform.xml move %ap%\platform.xml temp
if exist %ap%\handheld_hardware.xml move %ap%\handheld_hardware.xml temp
if exist %ap%\handheld_core_hardware.xml move %ap%\handheld_core_hardware.xml temp
copy %ap%\* %ab%
move temp\* %ap%
RD /S /Q temp
if errorlevel 1 (
echo.
echo Sorry, But an error occured
echo Delete and Copy Errored Out at Copying From Port\Permissions >>script\txt\log.txt
PAUSE
call script\fail.bat
)
echo Copying From Port\Permissions Completed >>script\txt\log.txt

set abi=BASE\system\etc\init.d
set api=PORT\system\etc\init.d
if not exist %abi% goto noinit
if not exist %api% goto noinit
if not exist temp mkdir temp
if exist %abi%\*banner* copy %abi%\*banner* temp
RD /S /Q %abi%
mkdir %abi%
if exist temp\* move temp\* %abi%
RD /S /Q temp
if errorlevel 1 (
echo.
echo Sorry, But an error occured
echo Delete and Copy Errored Out at Copying From Base\Init.d >>script\txt\log.txt
PAUSE
call script\fail.bat
)
echo Copying From Base\Init.d Completed >>script\txt\log.txt

if not exist temp mkdir temp
if exist %api%\*banner* move %api%\*banner* temp
if exist %api%\* copy %api%\* %abi%
if errorlevel 1 (
echo.
echo Sorry, But an error occured
echo Delete and Copy Errored Out at Copying From Port\Init.d >>script\txt\log.txt
PAUSE
call script\fail.bat
)
:noinit
echo Copying From Port\Init.d Completed >>script\txt\log.txt

echo.
echo.
echo Done
echo.
set /a step+=1
echo %step% >script\txt\step.txt
echo Delete And Copy Completed Successfully >>script\txt\log.txt
echo. >>script\txt\log.txt
pause

call script\next.bat


ECHO OFF
color 70
CLS
set /p step=<script\txt\step.txt
set pname=step %step% : Delete
Title %pname%
echo.
echo Deleting unneccssary files. 
echo Delete Started >>script\txt\log.txt
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
echo Delete Errored Out at Deleting From Base\system >>script\txt\log.txt
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
copy PORT\system\priv-app\* BASE\system\priv-app
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
set /p aroma=Does the Rom have aroma installer (default-n)?(y/n) : 
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

echo.
echo.
echo Done
echo.
set /a step+=1
echo %step% >script\txt\step.txt
echo Delete Completed Successfully >>script\txt\log.txt
echo. >>script\txt\log.txt
pause

call script\next.bat


ECHO OFF
color 70
CLS
set /p step=<script\txt\step.txt
set pname=step %step% : Copy
Title %pname%
echo.
echo Copying some neccessary files. 
echo Copy Started >>script\txt\log.txt
echo.
pause

set a=%~dp0
     for %%b in ("!a:~0,-1!") do (
      set par=%%~dpb
)

cls
echo Copying Base\etc Started >>script\txt\log.txt
set ab=BASE\system\etc
set ap=PORT\system\etc
xcopy %ab%\*.* %ap%\*.* /y
xcopy %ap%\*.* %ab%\*.* /y
if errorlevel 1 (
echo.
echo Sorry, But an error occured
echo Copy Errored Out at Copying Base\etc >>script\txt\log.txt
PAUSE
call script\fail.bat
)
echo Copying Base\etc Completed >>script\txt\log.txt

echo Copying Base\bin Started >>script\txt\log.txt
set ab=BASE\system\bin
set ap=PORT\system\bin
xcopy %ab%\* %ap%\* /y
xcopy %ap%\* %ab%\* /y
if errorlevel 1 (
echo.
echo Sorry, But an error occured
echo Copy Errored Out at Copying Base\bin >>script\txt\log.txt
PAUSE
call script\fail.bat
)
echo Copying Base\bin Completed >>script\txt\log.txt


echo Copying Base\init.d Started >>script\txt\log.txt
set ab=BASE\system\etc\init.d
set ap=PORT\system\etc\init.d
if exist %ap% xcopy %ab%\* %ap%\* /y
xcopy %ap%\* %ab%\* /y
if errorlevel 1 (
echo.
echo Sorry, But an error occured
echo Copy Errored Out at Copying Base\etc\init.d >>script\txt\log.txt
PAUSE
call script\fail.bat
)
echo Copying Base\etc\init.d Completed >>script\txt\log.txt


echo Copying Base\permissions Started >>script\txt\log.txt
set ab=BASE\system\etc\permissions
set ap=PORT\system\etc\permissions
xcopy %ab%\* %ap%\* /y
xcopy %ap%\* %ab%\* /y
if errorlevel 1 (
echo.
echo Sorry, But an error occured
echo Copy Errored Out at Copying Base\etc\permissions >>script\txt\log.txt
PAUSE
call script\fail.bat
)
echo Copying Base\etc\permissions Completed >>script\txt\log.txt


echo Copying Base\lib Started >>script\txt\log.txt
set ab=BASE\system\lib
set ap=PORT\system\lib
if exist %ap% xcopy %ab%\*.so %ap%\* /y
xcopy %ap%\* %ab%\* /y
if errorlevel 1 (
echo.
echo Sorry, But an error occured
echo Copy Errored Out at Copying Base\lib >>script\txt\log.txt
PAUSE
call script\fail.bat
)
echo Copying Base\lib Completed >>script\txt\log.txt


echo Copying Base\xbin Started >>script\txt\log.txt
set ab=BASE\system\xbin
set ap=PORT\system\xbin
xcopy %ab%\* %ap%\* /y
xcopy %ap%\* %ab%\* /y
if errorlevel 1 (
echo.
echo Sorry, But an error occured
echo Copy Errored Out at Copying Base\xbin >>script\txt\log.txt
PAUSE
call script\fail.bat
)
echo Copying Base\xbin Completed >>script\txt\log.txt



echo.
echo.
echo Done
echo.
set /a step+=1
echo %step% >script\txt\step.txt
echo Copy Completed Successfully >>script\txt\log.txt
echo. >>script\txt\log.txt
pause

call script\next.bat


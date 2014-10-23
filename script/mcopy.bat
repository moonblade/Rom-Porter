ECHO OFF
color 70
CLS
set /p step=<script\txt\step.txt
title step %step% : Copy
echo Copying from Base No Replace Started >>script\txt\log.txt
echo.
echo Copying Some necessary files.
echo.
echo.

set v=BASE\system\addon.d
set u=PORT\system\addon.d
if exist %v% (
echo Copying Addon.d Files Started>>script\txt\log.txt
For %%F In (%v%\*) Do If Not Exist %u%\%%~nF Copy %%F %u%
if errorlevel 1 (
echo.
echo Sorry, But an error occured
echo Copying Errored Out at Copying Addon.d Files >>script\txt\log.txt
PAUSE
call script\fail.bat
)
echo Copying Addon.d Files Completed>>script\txt\log.txt
)

set v=BASE\system\bin
set u=PORT\system\bin
if exist %v% (
echo Copying Bin Files Started>>script\txt\log.txt
For %%F In (%v%\*) Do If Not Exist %u%\%%~nF Copy %%F %u%
if errorlevel 1 (
echo.
echo Sorry, But an error occured
echo Copying Errored Out at Copying Bin Files >>script\txt\log.txt
PAUSE
call script\fail.bat
)
echo Copying Bin Files Completed>>script\txt\log.txt
)

set v=BASE\system\etc
set u=PORT\system\etc
if exist %v% (
echo Copying Etc Files Started>>script\txt\log.txt
For %%F In (%v%\*) Do If Not Exist %u%\%%~nF Copy %%F %u%
if errorlevel 1 (
echo.
echo Sorry, But an error occured
echo Copying Errored Out at Copying Etc Files >>script\txt\log.txt
PAUSE
call script\fail.bat
)
echo Copying Etc Files Completed>>script\txt\log.txt
)

set v=BASE\system\customize
set u=PORT\system\customize
if exist %v% (
echo Copying Customize Files Started>>script\txt\log.txt
For %%F In (%v%\*) Do If Not Exist %u%\%%~nF Copy %%F %u%
if errorlevel 1 (
echo.
echo Sorry, But an error occured
echo Copying Errored Out at Copying Customize Files >>script\txt\log.txt
PAUSE
call script\fail.bat
)
echo Copying Customize Files Completed>>script\txt\log.txt
)

set v=BASE\system\framework
set u=PORT\system\framework
if exist %v% (
echo Copying Framework Files Started>>script\txt\log.txt
For %%F In (%v%\*) Do If Not Exist %u%\%%~nF Copy %%F %u%
if errorlevel 1 (
echo.
echo Sorry, But an error occured
echo Copying Errored Out at Copying Framework Files >>script\txt\log.txt
PAUSE
call script\fail.bat
)
echo Copying Framework Files Completed>>script\txt\log.txt
)

set v=BASE\system\lib
set u=PORT\system\lib
if exist %v% (
echo Copying Lib Files Started>>script\txt\log.txt
For %%F In (%v%\*) Do If Not Exist %u%\%%~nF Copy %%F %u%
if errorlevel 1 (
echo.
echo Sorry, But an error occured
echo Copying Errored Out at Copying Lib Files >>script\txt\log.txt
PAUSE
call script\fail.bat
)
echo Copying Lib Files Completed>>script\txt\log.txt
)

set v=BASE\system\vendor
set u=PORT\system\vendor
if exist %v% (
echo Copying Vendor Files Started>>script\txt\log.txt
For %%F In (%v%\*) Do If Not Exist %u%\%%~nF Copy %%F %u%
if errorlevel 1 (
echo.
echo Sorry, But an error occured
echo Copying Errored Out at Copying Vendor Files >>script\txt\log.txt
PAUSE
call script\fail.bat
)
echo Copying Vendor Files Completed>>script\txt\log.txt
)

set v=BASE\system\xbin
set u=PORT\system\xbin
if exist %v% (
echo Copying xbin Files Started>>script\txt\log.txt
For %%F In (%v%\*) Do If Not Exist %u%\%%~nF Copy %%F %u%
if errorlevel 1 (
echo.
echo Sorry, But an error occured
echo Copying Errored Out at Copying xbin Files >>script\txt\log.txt
PAUSE
call script\fail.bat
)
echo Copying xbin Files Completed>>script\txt\log.txt
)

echo.
echo Done
echo.
set /a step+=1
echo %step% >script\txt\step.txt
echo Copying from Base No Replace Completed Successfully >>script\txt\log.txt
echo. >>script\txt\log.txt
pause
call script\next.bat


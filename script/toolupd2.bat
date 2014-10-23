ECHO OFF
color 70
CLS
title Install Update.
if exist gpn.txt (
set /p gpn=<gpn.txt
del gpn.txt
rd /s /q %gpn%
) else (
echo.
echo Some Error Occured.
echo.
pause
goto :EOF )
  7za x "Rom-Porter-v*.zip" -y
del 7za.exe
del Rom-Porter-v*.zip
echo.
echo Done
echo.
pause
del %~dp0






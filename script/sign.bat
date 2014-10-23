ECHO OFF
color 70
CLS
title Sign
rem Not yet made official, to sign the final rom
:sign
cls
REM cd "%~dp0"
echo.
echo   Signing the Rom
echo.
REM call essentials\java.exe -Xmx2048m -jar "%~dp0essentials\signapk.jar" -w "%~dp0essentials\testkey.x509.pem" "%~dp0essentials\testkey.pk8" "%~dp0OUTPUT\%name%_unsigned.zip" "%~dp0OUTPUT\%name%_signed.zip"
java -Xmx2048m -jar "%~dp0essentials\signapk.jar" -w "%~dp0essentials\testkey.x509.pem" "%~dp0essentials\testkey.pk8" "%~dp0OUTPUT\%name%_unsigned.zip" "%~dp0OUTPUT\%name%_signed.zip"
echo.
if errorlevel 1 (
echo Sorry, But an error occured
PAUSE
call script\fail.bat
)  

echo.
echo Done
echo.
REM echo 9 >script\txt\step.txt
pause

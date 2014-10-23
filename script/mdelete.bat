ECHO OFF
color 70
CLS
set /p step=<script\txt\step.txt
title step %step% : Delete
echo Delete Started >>script\txt\log.txt
echo.
echo.
echo Deleting Unnecessary files
echo.
rd /s /q PORT\META-INF
rd /s /q PORT\system\vendor
rd /s /q PORT\system\lib\egl
rd /s /q PORT\system\lib\modules
rd /s /q PORT\system\lib\hw
if errorlevel 1 (
echo Sorry, But an error occured
echo Manufacture ROM Port Errored Out at Delete >>script\txt\log.txt
PAUSE
call script\fail.bat
)
echo.
echo Done
echo.
set /a step+=1
echo %step% >script\txt\step.txt
echo Delete Completed Successfully >>script\txt\log.txt
echo. >>script\txt\log.txt
pause
call script\next.bat

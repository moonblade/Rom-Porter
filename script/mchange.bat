ECHO OFF
color 70
CLS
set /p step=<script\txt\step.txt
title step %step% : change-EOL-char
echo.
echo Changing EOL char
echo.

set uu=PORT\META-INF\com\google\android\updater-script
set u=PORT\system\build.prop

rename %uu% abc
call essentials\change "PORT\META-INF\com\google\android\abc" > "PORT\META-INF\com\google\android\updater-script"
del PORT\META-INF\com\google\android\abc
rename %u% abc
call essentials\change "PORT\system\abc" > "PORT\system\build.prop"
del PORT\system\abc

echo.
echo Done
echo.
pause
set /a step+=1
echo %step% >script\txt\step.txt
echo EOL Char Changed >>script\txt\log.txt
echo. >>script\txt\log.txt
call script\next.bat
echo.
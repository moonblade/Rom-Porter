ECHO OFF
color 70
CLS
set /p step=<script\txt\step.txt
title step %step% : change-EOL-char
echo.
echo Changing EOL Character
echo.
set uu=BASE\META-INF\com\google\android\updater-script
set u=BASE\system\build.prop

rename %uu% abc
call essentials\change "BASE\META-INF\com\google\android\abc" > "BASE\META-INF\com\google\android\updater-script"
del BASE\META-INF\com\google\android\abc
rename %u% abc
call essentials\change "BASE\system\abc" > "BASE\system\build.prop"
del BASE\system\abc

set /a step+=1
echo %step% >script\txt\step.txt
echo EOL Char Changed >>script\txt\log.txt
Echo.
echo Done
echo.
pause
call script\next.bat
echo.
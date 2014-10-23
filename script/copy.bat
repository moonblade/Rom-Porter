ECHO OFF
color 70
CLS
set /p step=<script\txt\step.txt
title step %step% : 




echo.
echo Done
echo.
set /a step+=1
echo %step% >script\txt\step.txt
pause
call script\next.bat


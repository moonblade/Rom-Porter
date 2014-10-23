ECHO OFF
color 70
CLS
set /p step=<script\txt\step.txt
title step %step% : Kernel Check
echo Checking Kernel Started >>script\txt\log.txt
:start
cls
echo.
echo.
set yes=~
set /p yes=Does the rom Contain the kernel in the same zip? : 
if %yes%==~ (
echo.
echo Please enter a valid response
echo.
pause
goto start
)
if not %yes%==y goto :nope
echo Kernel Is Present >>script\txt\log.txt
cls
echo Asking User to Edit Kernel >>script\txt\log.txt
echo.
echo.
echo This Tool Will exit now.
echo.
echo.
echo Please Follow the instructions On the Notepad And then restart the tool.
echo.
echo.
echo Press enter to open the instruction Notepad
pause
echo.
set /a step+=1
echo %step% >script\txt\step.txt
start notepad++ essentials\txt\inkernel.txt
echo Exiting Tool >>script\txt\log.txt
echo. >>script\txt\log.txt
echo.
exit

:nope
echo.
echo Done
echo.
set /a step+=1
echo %step% >script\txt\step.txt
echo Kernel Is Not Present >>script\txt\log.txt
echo. >>script\txt\log.txt
pause
call script\next.bat


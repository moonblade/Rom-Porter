ECHO OFF
color 70
:start
set /p step=<script\txt\step.txt
CLS
rem select which rom, and echo it to the file, name.txt
set /a cnt=0
set pname=step %step% : select rom
Title %pname%
ECHO.
ECHO.
echo Select the Rom Which you wish to port
set /a cnt1=1
ECHO   %cnt1%. MIUI
set /a cnt1=%cnt1%+1
ECHO   %cnt1%. Paranoid Android
set /a cnt1=%cnt1%+1
ECHO   %cnt1%. PAC Man
set /a cnt1=%cnt1%+1
ECHO   %cnt1%. Stock
set /a cnt1=%cnt1%+1
ECHO   %cnt1%. Cynogen based 
set /a cnt1=%cnt1%+1
echo.
ECHO   %cnt1%. Lewa OS
set /a cnt1=%cnt1%+1
ECHO   %cnt1%. Joy OS 
set /a cnt1=%cnt1%+1
echo.
ECHO   %cnt1%. Manufacturer ROM
set /a cnt1=%cnt1%+1
echo.
ECHO   %cnt1%. Go back to main menu

echo.
echo.
set M=~
SET /P M=Type your choice then press ENTER:
set /a step+=1
echo %step% >script\txt\step.txt
set /a cnt=%cnt%+1
IF %M%==%cnt% set romname=miui && goto next1
set /a cnt=%cnt%+1
IF %M%==%cnt% set romname=pa && goto next1
set /a cnt=%cnt%+1
IF %M%==%cnt% set romname=pac && goto next1
set /a cnt=%cnt%+1
IF %M%==%cnt% set romname=stock && goto next1
set /a cnt=%cnt%+1
IF %M%==%cnt% set romname=cm && goto next1
set /a cnt=%cnt%+1
IF %M%==%cnt% set romname=lewa && goto next1
set /a cnt=%cnt%+1
IF %M%==%cnt% set romname=joy && goto next1
set /a cnt=%cnt%+1
IF %M%==%cnt% set romname=man && goto next1

set /a cnt=%cnt%+1
IF %M%==%cnt% goto backhome
goto rest

:backhome
set /p step=<script\txt\step.txt
set %step%-=1
echo 0 >script\txt\step.txt
goto :eof

:rest
call script\invalid.bat && goto start
pause

:next1
echo %romname%>script\txt\name.txt
Echo Rom Selected as %romname% >>script\txt\log.txt
call script\extract.bat
goto :eof

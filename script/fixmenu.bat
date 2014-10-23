ECHO OFF
color 70
CLS
:MAIN
CLS
set /a cnt=0
set pname=FIX
Title %pname%
ECHO.
ECHO.
ECHO                                  %pname%
ECHO                             ^+===========^+ 
ECHO.
set /a cnt1=1
ECHO   %cnt1%. Bootloop Fix
echo.
set /a cnt1=%cnt1%+1
ECHO   %cnt1%. HTC network auto select Fix
echo.
set /a cnt1=%cnt1%+1
ECHO   %cnt1%. Back To Main Menu
echo.
echo.
set M=~
SET /P M=Type your choice then press ENTER:
set /a cnt=%cnt%+1
IF %M%==%cnt% call script\bl.bat && goto main
set /a cnt=%cnt%+1
IF %M%==%cnt% call script\htcnet.bat && goto main
set /a cnt=%cnt%+1
IF %M%==%cnt% goto :eof

call script\invalid.bat && goto main

ECHO OFF
color 70
:misc
cls
echo.
echo.
echo                   Miscellaneous Options
echo                   ---------------------
echo.
set /a cnt1=1
ECHO   %cnt1%. Open Tool Thread
echo.
set /a cnt1=%cnt1%+1
ECHO   %cnt1%. Open Porting Guide
echo.
set /a cnt1=%cnt1%+1
ECHO   %cnt1%. Open Manufacturer ROM Porting Guide
echo.
set /a cnt1=%cnt1%+1
ECHO   %cnt1%. Logo
echo.
set /a cnt1=%cnt1%+1
ECHO   %cnt1%. Intro
echo.
set /a cnt1=%cnt1%+1


ECHO   %cnt1%. Go back to Main Menu
echo.
set /a cnt1=%cnt1%+1

echo.
echo.
set M=~
SET /P M=Type your choice then press ENTER:
if %M%==~ call script\invalid.bat & goto misc
set cnt=0
set /a cnt=%cnt%+1
IF %M%==%cnt% start http://forum.xda-developers.com/showthread.php?t=2276871 & goto misc
set /a cnt=%cnt%+1
IF %M%==%cnt% start http://forum.xda-developers.com/showthread.php?t=1908008 & goto misc
set /a cnt=%cnt%+1
IF %M%==%cnt% start http://forum.xda-developers.com/showthread.php?t=2245786 & goto misc
set /a cnt=%cnt%+1
IF %M%==%cnt% cls & type essentials\txt\logo.txt & pause & goto misc
set /a cnt=%cnt%+1
IF %M%==%cnt% (
if exist script\intro.exe call script\intro.exe & set comp=1
if not comp==1 if exist essentials\intro.exe call essentials\intro.exe
goto :misc
)


set /a cnt=%cnt%+1
IF %M%==%cnt% goto :eof
call script\invalid.bat & goto misc
ECHO OFF
color 70
CLS
set pname=help
Title %pname%
:HELP
cls
Title %pname%
ECHO.
ECHO.
echo                        HELP
echo                    ------------
ECHO.
set /a cnt1=1
ECHO   %cnt1%. About the Tool
echo.
set /a cnt1=%cnt1%+1
ECHO   %cnt1%. Porting Help
echo.
set /a cnt1=%cnt1%+1
ECHO   %cnt1%. Fix Help
echo.
set /a cnt1=%cnt1%+1
ECHO   %cnt1%. Reset Help
echo.
set /a cnt1=%cnt1%+1
ECHO   %cnt1%. LOG Help
echo.
set /a cnt1=%cnt1%+1
ECHO   %cnt1%. Update Help
echo.
set /a cnt1=%cnt1%+1
ECHO   %cnt1%. Misc Help
echo.
set /a cnt1=%cnt1%+1
ECHO   %cnt1%. HELP Help


echo.
set /a cnt1=%cnt1%+1
ECHO   %cnt1%. Go back to Main Menu

echo.
echo.
set M=~
SET /P M=Type your choice then press ENTER:
if %M%==~ call script\invalid.bat & goto help
set cnt=0
set /a cnt=%cnt%+1
IF %M%==%cnt% goto about
set /a cnt=%cnt%+1
IF %M%==%cnt% cls & type essentials\txt\help\port.txt & pause & goto help
set /a cnt=%cnt%+1
IF %M%==%cnt% cls & type essentials\txt\help\fix.txt & pause & goto help
set /a cnt=%cnt%+1
IF %M%==%cnt% cls & type essentials\txt\help\reset.txt & pause & goto help
set /a cnt=%cnt%+1
IF %M%==%cnt% cls & type essentials\txt\help\log.txt & pause & goto help
set /a cnt=%cnt%+1
IF %M%==%cnt% cls & type essentials\txt\help\update.txt & pause & goto help
set /a cnt=%cnt%+1
IF %M%==%cnt% cls & type essentials\txt\help\misc.txt & pause & goto help
set /a cnt=%cnt%+1
IF %M%==%cnt% cls & type essentials\txt\help\help.txt & pause & goto help

set /a cnt=%cnt%+1
IF %M%==%cnt% goto :eof
call script\invalid.bat & goto help

:about
cls
echo.
echo.
set /p vers=<script\txt\version.txt
echo        Tool Name       : ROM-PORTER
echo.
echo        Description     : Simple Tool to Port roms to your device
echo.
echo        Type            : Batch
echo.
echo        Current Version : %vers%
echo. 
echo        Developer       : mnishamk @xda
echo.
echo        License         : GPL
echo.
echo.
pause
goto help

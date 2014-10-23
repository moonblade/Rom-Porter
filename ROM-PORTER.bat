@ECHO OFF
REM BFCPEOPTIONSTART
REM Advanced BAT to EXE Converter www.BatToExeConverter.com
REM BFCPEEXE=E:\Nisham\mini-pro-phone\Tools\workdir rom porter\ROM-PORTER.exe
REM BFCPEICON=C:\Program Files (x86)\Advanced BAT to EXE Converter PRO v2.49\ab2econv249pro\icons\icon9.ico
REM BFCPEICONINDEX=1
REM BFCPEEMBEDDISPLAY=0
REM BFCPEEMBEDDELETE=1
REM BFCPEVERINCLUDE=1
REM BFCPEVERVERSION=3.2.0.0
REM BFCPEVERPRODUCT=ROM PORTER
REM BFCPEVERDESC=Port your Roms easily
REM BFCPEVERCOMPANY=Tool Aces
REM BFCPEVERCOPYRIGHT=GPL
REM BFCPEOPTIONEND
@ECHO ON

@ECHO OFF
rem coloring is important.
color 70

rem finding the system version
set /p bit=<script\txt\bit.txt
set %bit: =%
if %bit%==0 call script\bit.bat

rem    all right, not the best thing to do, so if anyone doesnt want it, delete
rem                   intro.exe from script\ simple enough
if exist script\intro.exe call script\intro.exe & set comp=1
if not comp==1 if exist script\intro.bat call script\intro.bat

:MAIN
if not exist PORT mkdir PORT
if not exist BASE mkdir BASE
set /p name=<script\txt\name.txt
set name=%name: =%

CLS
set /p step=<script\txt\step.txt
set /a cnt=0
set pname=ROM PORTER
Title %pname%
ECHO.
ECHO.
ECHO                             ^+================^+ 
ECHO                                 %pname%
ECHO                             ^+================^+ 
ECHO                                          - By mnishamk
ECHO.
ECHO                                   MAIN MENU   
ECHO                                   =========
set /a cnt1=1
rem see how i used a variable in place of just typing it, so i can press ctrl+D and just change the text.
rem This way i can enter an option in between without any editing.
rem yet another example to show that i am lazy.
if %step%==0 ( ECHO   %cnt1%. Start porting rom ) else (  ECHO   %cnt1%. Continue porting rom )
echo.
set /a cnt1=%cnt1%+1
ECHO   %cnt1%. Fix Menu
echo.
set /a cnt1=%cnt1%+1
ECHO   %cnt1%. Copy zip to root of SD card.
echo.
set /a cnt1=%cnt1%+1
ECHO   %cnt1%. Reset
echo.
set /a cnt1=%cnt1%+1
ECHO   %cnt1%. Pull Log File
echo.
set /a cnt1=%cnt1%+1
ECHO   %cnt1%. Pre-Requisites
echo.
set /a cnt1=%cnt1%+1
ECHO   %cnt1%. Check for Updates.
echo.
set /a cnt1=%cnt1%+1
ECHO   %cnt1%. Miscellaneous Options 
echo.
set /a cnt1=%cnt1%+1
ECHO   %cnt1%. Help
echo.
ECHO   x. Exit

echo.
echo.
set M=~
SET /P M=Type your choice then press ENTER:
set /a cnt=%cnt%+1
IF %M%==%cnt% (
REM for splitting into modules for pause and continue
 if %step%==0 call script\select-rom.bat
 if %step%==1 call script\extract.bat
 set /p name=<script\txt\name.txt
 set name=%name: =%
 REM goto %name%
 REM set asked=0
 call script\next.bat
 REM if %asked%==1 goto main
)

rem fixing bootloop and htc bug
set /a cnt=%cnt%+1
IF %M%==%cnt% call script\fixmenu.bat && goto main

rem for copying to root directory
set /a cnt=%cnt%+1
IF %M%==%cnt% call script\copyroot.bat && goto main

rem reseting evertyhing
set /a cnt=%cnt%+1
IF %M%==%cnt% call script\reset.bat && goto main

rem pulling log file
set /a cnt=%cnt%+1
IF %M%==%cnt% call script\Pulog.bat && goto main

rem pre requisite knowledge
set /a cnt=%cnt%+1
IF %M%==%cnt% call script\prk.bat && goto main

rem For updating the tool
set /a cnt=%cnt%+1
IF %M%==%cnt% call script\toolupd.bat && goto main

rem Miscllaneous
set /a cnt=%cnt%+1
IF %M%==%cnt% call script\misc.bat && goto main

rem help text
set /a cnt=%cnt%+1
IF %M%==%cnt% call script\help.bat && goto main

rem coz i'm lazy i dont wanna zip the tool, it mannually every time.
IF %M%==create call script\create.bat && goto main

rem Of course, when you gotta go, You gotta go. :D
IF %M%==x goto exit

rem In case the option slips through
call script\invalid.bat && goto main

 rem After rom porting is complete, Prompting user for reset
:reset
cls
echo.
echo.
echo The previous ROM Porting has been completed, 
set ooo=!
set /p ooo=Do you want to call Reset script (y/n) : 
if %ooo%==y call script\reset.bat && goto main
if %ooo%==n ( 
echo.
echo OK, as you wish. But i'll keep asking.
echo.
pause
goto main
)
call script\invalid.bat && goto reset


:exit
cls
set comp==0
if exist script\exitrp.exe call script\exitrp.exe & set comp=1
if not comp==1 if exist script\exitrp.bat call script\exitrp.bat
echo.

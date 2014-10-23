ECHO OFF
color 70
CLS
title RESET
rem well you gotta delete everything to start over, dont ya?
set y=n
echo.
set /p y=are you sure? all your progress will be lost (default - n) : 
if not %y%==y goto :eof
If exist PORT ( RD /S /Q PORT)
If exist temp ( RD /S /Q temp)
If exist BASE ( RD /S /Q BASE)
If exist upd ( RD /S /Q upd)
If exist LOG ( RD /S /Q LOG)
rem echoing default values to the text files.
echo 0 >script\txt\name.txt
echo 0 >script\txt\step.txt
echo 0 >script\txt\exb.txt
echo. >script\txt\log.txt
REM echo 0 >script\txt\bit.txt
REM if exist essentials\find.exe del essentials\find.exe
REM if exist essentials\findstr.exe del essentials\findstr.exe
echo.
echo Done.
Echo.
Pause

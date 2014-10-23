ECHO OFF
color 70
CLS
echo Build.Prop Tweaks Started >>script\txt\log.txt
set /p step=<script\txt\step.txt
title step %step% : Build.prop Tweaks

if not exist essentials\btweak (
echo No Tweaks found
echo.
echo No tweaks >>script\txt\log.txt
pause
goto :eof )
ECHO.

set a=%~dp0
     for %%b in ("!a:~0,-1!") do (
      set par=%%~dpb
)

set _source=%par%essentials\btweak

:Display
cls
echo.
echo Please select build.prop tweaks from the following list.
echo Note: Please do not apply many tweaks at once and harm your device.
echo.
SetLocal EnableDelayedExpansion
Set _Count=0
For /F "Tokens=* Delims=" %%I In ('Dir /A-D /B "%_Source%\*.txt" 2^>Nul') Do ( Set /A _Count+=1
Set _F!_Count!=%%~nI
)
If %_Count%==0 (
Echo.
echo No tweaks >>script\txt\log.txt
echo No Tweaks found
echo.
pause
Goto :EOF )
For /L %%I In (1,1,%_Count%) Do Echo.%%I. !_F%%I!
echo.
set /a last=%_Count%+1
echo %last%. Done. Go to next step.

:_Ask
Echo.
Set /P _Choice=Please enter an input:
if %_Choice%==%last% goto next
If %_Choice% GTR %last% Echo.Please enter a number between 1 and %last% & pause & Goto :_Ask
Set FileName=!_F%_Choice%!
echo.
echo.
echo you have selected : %FileName%
goto sure



:sure
echo.
set y=n
set/p y=Are you sure you want to apply this tweak? : 
if not %y%==y goto Display
echo.
set u=PORT\system
echo Applied Build Tweak %FileName% >>script\txt\log.txt
Type "%_Source%\%FileName%.txt">>%u%\build.prop


echo.
echo Done
echo.
pause
goto Display

:next
echo Build.prop Tweaks Completed Successfully >>script\txt\log.txt
echo. >>script\txt\log.txt
set /a step+=1
echo %step% >script\txt\step.txt
call script\next.bat

ECHO OFF
color 70
CLS
set /p step=<script\txt\step.txt
title step %step% : Init.d Tweaks
echo Init.d Tweaks  Started >>script\txt\log.txt
if not exist essentials\itweak (
echo No Tweaks found
echo.
pause
goto :eof )
ECHO.

set a=%~dp0
     for %%b in ("!a:~0,-1!") do (
      set par=%%~dpb
)

set _source=%par%essentials\itweak

:Display
cls
echo.
echo Please select Init.d tweaks from the following list.
echo Note: Please do not apply many tweaks at once and harm your device.
echo.
SetLocal EnableDelayedExpansion
Set _Count=0
For /F "Tokens=* Delims=" %%I In ('Dir /A-D /B "%_Source%\*" 2^>Nul') Do ( Set /A _Count+=1
Set _F!_Count!=%%~nI
)
If %_Count%==0 (
Echo.
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
set u=PORT\system\etc\init.d
copy "%_Source%\%FileName%" %u%
rename %u%\%Filename% tweak%random%
if errorlevel 1 (
echo Sorry, But an error occured
echo errored Out at Init.d Tweaks >>script\txt\log.txt
PAUSE
call script\fail.bat
)
echo Applied Init.d Tweak %FileName% >>script\txt\log.txt

echo.
echo Done
echo.
pause
goto Display

:next
echo Init.d Tweaks Completed Successfully >>script\txt\log.txt
echo. >>script\txt\log.txt
set /a step+=1
echo %step% >script\txt\step.txt
call script\next.bat

ECHO OFF
color 70
CLS
IF NOT EXIST OUTPUT ( 
echo.
echo No flashable zips Found
echo.
pause
goto :eof
) 

echo.
echo make sure that the sdcard is not connected to pc.
echo.
pause

set a=%~dp0
     for %%b in ("!a:~0,-1!") do (
      set par=%%~dpb
)

set _source=%par%OUTPUT
echo Copying to SD Started >>script\txt\log.txt

:Display
cls
echo.
echo Select the flashable zip to copy to root of sd card.
echo.
SetLocal EnableDelayedExpansion
Set _Count=0
For /F "Tokens=* Delims=" %%I In ('Dir /A-D /B "%_Source%\*.zip" 2^>Nul') Do ( Set /A _Count+=1
Set _F!_Count!=%%~nI
)
If %_Count%==0 (
Echo.
echo No flashable zips found
echo.
pause
Goto :EOF )
For /L %%I In (1,1,%_Count%) Do Echo.%%I. !_F%%I!


:_Ask
Echo.
Set /P _Choice=Please enter an input:
If %_Choice% GTR %_Count% Echo.Please enter a number between 1 and %_Count% & pause & Goto :_Ask
Set FileName=!_F%_Choice%!
echo.
if not exist 7za.exe copy essentials\7za.exe
if not exist adb.exe   7za x "essentials\start.zip" -y
del 7za.exe 
adb wait-for-device
adb push OUTPUT/%FileName%.zip /mnt/sdcard
adb kill-server
del adb.exe
del AdbWinApi.dll
del AdbWinUsbApi.dll
echo.
echo Done.
echo.
echo Copying to SD Completed Successfully >>script\txt\log.txt
echo. >>script\txt\log.txt
pause



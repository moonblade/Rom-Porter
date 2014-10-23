ECHO OFF
color 70
set /p step=<script\txt\step.txt
set /p exb=<script\txt\exb.txt
set pname=step %step% : Extract
echo Extracting Started >>script\txt\log.txt
Title %pname%

if %exb%==1 goto :startp

:startb
CLS
echo.
set path=0
echo.
set /p "path=Drag the BASE rom to this window :" 
echo.
if %path%==0 (
echo.
echo inappropriate path, please drag a valid rom
echo.
pause
goto startb
)
copy %path% BASE
call essentials\7za.exe x "BASE\*.zip" -o"%cd%\BASE"
echo Base Extracting Started >>script\txt\log.txt
pause
del BASE\*.zip
if errorlevel 1 (
echo Sorry, But an error occured
echo Extracting Errored Out at Base Extract >>script\txt\log.txt
PAUSE
call script\fail.bat
)
echo Extracting Base Completed >>script\txt\log.txt
echo 1 >script\txt\exb.txt

:startp
CLS
echo.
set path=0
echo.
set /p "path=Drag the PORT rom to this window :"
echo.
if %path%==0 (
echo.
echo inappropriate path, please drag a valid rom
echo.
pause
goto startp
)
copy %path% PORT
call essentials\7za.exe x "PORT\*.zip" -o"%cd%\PORT"
del PORT\*.zip
echo Port Extracting Started >>script\txt\log.txt
if errorlevel 1 (
echo Sorry, But an error occured
echo Extracting Errored Out at Port Extract >>script\txt\log.txt
PAUSE
call script\fail.bat
)
echo Extracting Port Completed >>script\txt\log.txt

echo Done. 
echo.
set /a step+=1
echo %step% >script\txt\step.txt
echo Extraction Completed Successfully >>script\txt\log.txt
echo. >>script\txt\log.txt
pause

 set /p name=<script\txt\name.txt
 set name=%name: =%
 call script\next.bat

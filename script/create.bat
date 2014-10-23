ECHO OFF
color 70
CLS
set a=%~dp0
set u=temp\temp
setlocal enabledelayedexpansion
     for %%b in ("!a:~0,-1!") do (
      set par=%%~dpb
	  set parn=%%~nb
     for %%c in ("!par:~0,-1!") do (
      set gp=%%~dpc
      set gpn=%%~nc
)
)
:seta
cls
set cnt=~
set /p cnt=Enter name : Rom-porter-v
if %cnt%==~ (
echo.
echo Enter a valid version
echo.
pause
goto seta
)
echo %cnt% >script\txt\version.txt
set name=Rom-Porter-v%cnt%
echo.
echo Creating the zip
echo.
if exist %u% RD /S /Q %u%
mkdir %u%
mkdir %u%\essentials
mkdir %u%\script
xcopy essentials\* %u%\essentials /e
xcopy script\* %u%\script /e
set execopy=0
if exist ROM-PORTER.exe copy ROM-PORTER.exe %u% & set execopy=1
copy ROM-PORTER.bat %u%
copy essentials\7za.exe %u%
cd %u%
if exist essentials\intro.exe move essentials\intro.exe script
echo 0 >script\txt\step.txt
echo 0 >script\txt\name.txt
echo 0 >script\txt\bit.txt
echo 0 >script\txt\exb.txt
echo. >script\txt\log.txt
if exist essentials\rpversion.txt del essentials\rpversion.txt
if exist essentials\pat.txt del essentials\pat.txt
if exist essentials\find.exe del essentials\find.exe
if exist essentials\findstr.exe del essentials\findstr.exe
echo %cnt% >script\txt\version.txt
copy ROM-PORTER.bat essentials
rename essentials\ROM-PORTER.bat Source.txt
if %execopy%==1 del ROM-PORTER.bat
7za a -mx9 -tzip "%name%.zip" "*"
7za d %name%.zip 7za.exe
del 7za.exe

cd..
cd..
cd..
if not exist ROM-Porter mkdir ROM-Porter
copy "%gpn%\%u%\%name%.zip" ROM-Porter
copy "%gpn%\%u%\%name%.zip" "P:\Dropbox\Public"
echo %cnt% >"P:\Dropbox\Public\rpversion.txt"
RD /S /Q "%gpn%\temp"
echo.
echo Done
echo.
endlocal
pause
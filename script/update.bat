ECHO OFF
color 70
set /p step=<script\txt\step.txt
title step %step% : Updater-script Edit
:start
CLS
echo.
echo Editing Updater-script
echo Editing Updater Script Started >>script\txt\log.txt
echo.
set uu=BASE\META-INF\com\google\android\updater-script
set u=BASE\META-INF\com\google\android
set vv=PORT\META-INF\com\google\android\updater-script
set v=PORT\META-INF\com\google\android

rem finding lines which contain both set_perm and system and copying it to base
setlocal EnableDelayedExpansion
(for /F "delims=" %%a in (%uu%) do (
   set "line=%%a"
   if "!line:set_perm=!" neq "!line!" (
      if "!line:system=!" neq "!line!" (
         if not defined flag (
            essentials\findstr.exe "set_perm" %vv% | essentials\findstr.exe "system"
            set flag=true
         )
      ) else (
         echo !line!
      )
   ) else (
      echo !line!
   )
)) >%u%\output.txt 
del %uu% 
rename %u%\output.txt updater-script
if errorlevel 1 (
echo.
echo Sorry, But an error occured
echo Errored Out at Editing Updater Script >>script\txt\log.txt
PAUSE
call script\fail.bat
)

set /a step+=1
echo %step% >script\txt\step.txt
echo.
echo Done
echo.
echo Editing Updater Script Completed Successfully >>script\txt\log.txt
echo. >>script\txt\log.txt
pause

call script\next.bat
ECHO OFF
color 70
CLS
set /p step=<script\txt\step.txt
title step %step% : Framework-Res Editing
echo Manual Framework-res Edit Started >>script\txt\log.txt
echo.
echo Editing Framework-Res APK.
echo.
echo.
pause
echo.
echo Goto res\xml in Framework-res.apk of BASE and PORT and replace 
echo     the storage_list.xml of PORT with that of base.
echo.
echo Opening Base framework.res.apk now
start winrar BASE\system\framework\framework-res.apk
pause
echo Opening Port framework.res.apk now
start winrar PORT\system\framework\framework-res.apk
echo.
echo Remember BASE ---^> PORT
echo.
echo.
echo Press Enter After You Have Done it.
echo.
Pause
echo.
echo Done
echo.
set /a step+=1
echo %step% >script\txt\step.txt
echo Hopefully Framework-res Edit Completed Successfully >>script\txt\log.txt
echo. >>script\txt\log.txt
pause
call script\next.bat


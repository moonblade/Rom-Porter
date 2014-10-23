ECHO OFF
color 70
title SUCCESS
CLS
rem Finally they completed the porting. Whew!!
echo.
echo.
echo                       ===================================
echo                       ROM Porting completed Successfully.
echo                       ===================================
echo.
echo.
set /a step+=1
echo %step% >script\txt\step.txt
echo ROM PORTING Completed Successfully >>script\txt\log.txt
echo. >>script\txt\log.txt
pause
exit
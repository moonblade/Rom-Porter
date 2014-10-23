ECHO OFF
color 70
set /p step=<script\txt\step.txt
echo Stock Specific Editing Started >>script\txt\log.txt
Title step %step% : Stock
CLS
rem well i dont think theres anything extra to do in stock rom
echo.
echo Stock Specific Editing
echo.
echo.
echo Done
echo.
set /a step+=1
echo %step% >script\txt\step.txt
echo Stock Specific Editing Completed Successfully >>script\txt\log.txt
echo. >>script\txt\log.txt
pause

call script\btweak.bat
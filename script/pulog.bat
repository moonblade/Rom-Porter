ECHO OFF
color 70
CLS
if exist LOG RD /s /q LOG
if not exist LOG mkdir LOG
if exist script\txt\log.txt copy script\txt\log.txt LOG
rename LOG\log.txt LOG-%random%.txt
echo.
echo.
echo LOG has been Copied to LOG\ Directory.
echo.
pause


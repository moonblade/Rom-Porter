ECHO OFF
color 70
CLS
set /p step=<script\txt\step.txt
title step %step% : Copy and Replace
echo Copying from Base & Replace Started >>script\txt\log.txt
echo.
echo Copying Some More Files
echo.

echo Copying META-INF Started >>script\txt\log.txt
xcopy BASE\META-INF PORT\META-INF /e /i /h
if errorlevel 1 (
echo.
echo Sorry, But an error occured
echo Copying Errored Out at Copying META-INF >>script\txt\log.txt
PAUSE
call script\fail.bat
)
echo Copying META-INF Completed >>script\txt\log.txt

set v=BASE\system\bin
set u=PORT\system\bin
echo Copying Bin Files Started >>script\txt\log.txt
if exist %v%\adb xcopy %v%\adb %u%\adb /y
if exist %v%\brcm_patchram_plus xcopy %v%\brcm_patchram_plus %u%\brcm_patchram_plus /y
if exist %v%\linker xcopy %v%\linker %u%\linker /y
if exist %v%\logcat xcopy %v%\logcat %u%\logcat /y
if exist %v%\logwrapper xcopy %v%\logwrapper %u%\logwrapper /y
if exist %v%\rild xcopy %v%\rild %u%\rild /y
if exist %v%\rmt_storage xcopy %v%\rmt_storage %u%\rmt_storage /y
if exist %v%\vold xcopy %v%\vold %u%\vold /y
if exist %v%\wpa_cli xcopy %v%\wpa_cli %u%\wpa_cli /y
if exist %v%\wpa_supplicant xcopy %v%\wpa_supplicant %u%\wpa_supplicant /y
if errorlevel 1 (
echo.
echo Sorry, But an error occured
echo Copying Errored Out at Copying Bin Files >>script\txt\log.txt
PAUSE
call script\fail.bat
)
echo Copying Bin Files Completed >>script\txt\log.txt

set v=BASE\system\etc
set u=PORT\system\etc
echo Copying Etc Files Started >>script\txt\log.txt
if exist %v%\Bluetooth xcopy %v%\Bluetooth %u%\Bluetooth /y
if exist %v%\Dhcpcd xcopy %v%\Dhcpcd %u%\Dhcpcd /y
if exist %v%\Firmware xcopy %v%\Firmware %u%\Firmware /y
if exist %v%\gps xcopy %v%\gps %u%\gps /y
if exist %v%\init.d xcopy %v%\init.d %u%\init.d /y
if exist %v%\permissions xcopy %v%\permissions %u%\permissions /y
if exist %v%\ppp xcopy %v%\ppp %u%\ppp /y
if exist %v%\security xcopy %v%\security %u%\security /y
if exist %v%\ssh xcopy %v%\ssh %u%\ssh /y
if exist %v%\terminfo xcopy %v%\terminfo %u%\terminfo /y
if exist %v%\updatecmds xcopy %v%\updatecmds %u%\updatecmds /y
if exist %v%\wifi xcopy %v%\wifi %u%\wifi /y
if exist %v%\audio_effects.conf xcopy %v%\audio_effects.conf %u%\audio_effects.conf /y
if exist %v%\audio_policy.conf xcopy %v%\audio_policy.conf %u%\audio_policy.conf /y
if exist %v%\dbus.conf xcopy %v%\dbus.conf %u%\dbus.conf /y
if exist %v%\gps.conf xcopy %v%\gps.conf %u%\gps.conf /y
if exist %v%\init.*.sh xcopy %v%\init.*.sh %u%\init.*.sh /y
if exist %v%\media_codecs.xml xcopy %v%\media_codecs.xml %u%\media_codecs.xml /y
if exist %v%\media_profiles.xml xcopy %v%\media_profiles.xml %u%\media_profiles.xml /y
if exist %v%\nfcee_access.xml xcopy %v%\nfcee_access.xml %u%\nfcee_access.xml /y
if exist %v%\secomxregistry xcopy %v%\secomxregistry %u%\secomxregistry /y
if exist %v%\vold.fstab xcopy %v%\vold.fstab %u%\vold.fstab /y
if errorlevel 1 (
echo.
echo Sorry, But an error occured
echo Copying Errored Out at Copying Etc Files >>script\txt\log.txt
PAUSE
call script\fail.bat
)
echo Copying Etc Files Completed >>script\txt\log.txt

set v=BASE\system\lib
set u=PORT\system\lib
echo Copying Lib Files Started >>script\txt\log.txt
if exist %v%\liblog.so xcopy %v%\liblog.so %u%\liblog.so /y
if exist %v%\libsecril-client xcopy %v%\libsecril-client %u%\libsecril-client /y
if exist %v%\libreference-ril.so xcopy %v%\libreference-ril.so %u%\libreference-ril.so /y
if exist %v%\libril.so xcopy %v%\libril.so %u%\libril.so /y
if exist %v%\libs3cjpeg.so xcopy %v%\libs3cjpeg.so %u%\libs3cjpeg.so /y
rem if port doesnt boot, use the port libaudioflinger.so
if exist %v%\libaudioflinger.so xcopy %v%\libaudioflinger.so %u%\libaudioflinger.so /y
if exist %v%\libaudioutils.so xcopy %v%\libaudioutils.so %u%\libaudioutils.so /y
if exist %v%\libtinyalsa.so xcopy %v%\libtinyalsa.so %u%\libtinyalsa.so /y
if errorlevel 1 (
echo.
echo Sorry, But an error occured
echo Copying Errored Out at Copying Lib Files >>script\txt\log.txt
PAUSE
call script\fail.bat
)
echo Copying Lib Files Completed >>script\txt\log.txt

setlocal enabledelayedexpansion
echo Copying Lib\Ril Files Started >>script\txt\log.txt
For /F "Tokens=* Delims=" %%b In ('Dir /A-D /B "%v%\*" 2^>Nul') Do (
set name=%%b 
setlocal enabledelayedexpansion
if not "!name!"=="!name:ril=!" copy %v%\!name! %u%\!name!
)
if errorlevel 1 (
echo.
echo Sorry, But an error occured
echo Copying Errored Out at Copying Lib\Ril Files >>script\txt\log.txt
PAUSE
call script\fail.bat
)
echo Copying Lib\Ril Files Completed >>script\txt\log.txt
endlocal

:askhtc
cls
echo.
echo.
set htc=~
set /p htc=Are you Porting An HTC Rom? (y/n) : 
if %htc%==~ (
echo.
echo Please Enter a Valid Reply.
echo.
pause
goto askhtc
)
if not %htc%==y goto :nothtc
:htc
echo Copying HTC Lib File Started >>script\txt\log.txt
if exist %v%\libhardware_legacy.so xcopy %v%\libhardware_legacy.so %u%\libhardware_legacy.so /y
if errorlevel 1 (
echo.
echo Sorry, But an error occured
echo Copying Errored Out at Copying HTC Lib Files >>script\txt\log.txt
PAUSE
call script\fail.bat
)
echo Copying HTC Lib File Completed >>script\txt\log.txt


:nothtc
set v=BASE\system\usr
set u=PORT\system\usr
if exist %v% xcopy %v% %u% /e /y
if errorlevel 1 (
echo.
echo Sorry, But an error occured
echo Copying Errored Out at Copying Usr Files >>script\txt\log.txt
PAUSE
call script\fail.bat
)
echo Copying Usr Files Completed >>script\txt\log.txt

echo.
echo Done
echo.
set /a step+=1
echo %step% >script\txt\step.txt
echo Copying from Base & Replace Completed Successfully >>script\txt\log.txt
echo. >>script\txt\log.txt
pause
call script\next.bat



 set /p step=<script\txt\step.txt
 set /p name=<script\txt\name.txt
 set name=%name: =%
 goto %name%


:man
 if %step%==2 call script\mdelete.bat 
 if %step%==3 call script\mcopy.bat   
 if %step%==4 call script\mcopy2.bat  
 if %step%==5 call script\mbuild.bat  
 if %step%==6 call script\mframe.bat  
 if %step%==7 call script\mchange.bat 
 if %step%==8 call script\mcheck.bat  
 if %step%==9 call script\mbtweak.bat 
 if %step%==10 call script\mzip.bat   
 if %step%==11 call script\success.bat 
 goto reset 
 
:cm
:miui
:stock
:pac
:pa
 if %step%==2 call script\delete.bat  
 if %step%==3 call script\build.bat   
 if %step%==4 call script\update.bat  
 if %step%==5 call script\copyex.bat  
 if %step%==6 call script\%name%.bat  
 if %step%==7 call script\btweak.bat  
 if %step%==8 call script\itweak.bat  
 if %step%==9 call script\change.bat  
 if %step%==10 call script\zip.bat   
 if %step%==11 call script\success.bat 
 goto reset 

:joy
:lewa
 if %step%==2 call script\jdelete.bat  
 if %step%==3 call script\jcopy.bat  
 if %step%==4 call script\jbuild.bat  
 if %step%==5 call script\%name%.bat    
 if %step%==6 call script\btweak.bat  
 if %step%==7 call script\itweak.bat  
 if %step%==8 call script\change.bat  
 if %step%==9 call script\zip.bat   
 if %step%==10 call script\success.bat 
 goto reset 
 
 :reset
cls
echo.
echo.
echo The previous ROM Porting has been completed, 
set ooo=!
set /p ooo=Do you want to call Reset script (y/n) : 
if %ooo%==y call script\reset.bat && goto main
if %ooo%==n ( 
echo.
echo OK, as you wish. But i'll keep asking.
echo.
set asked=1
pause
goto :eof
)
call script\invalid.bat && goto reset
 


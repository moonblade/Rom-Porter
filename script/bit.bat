ECHO OFF
color 70
CLS
title Windows Version
rem to check which windows user has
:menu
@echo off
FOR /F "tokens=3" %%x in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /V PROCESSOR_ARCHITECTURE') do set CPU=%%x
echo CPU Architecture: %CPU%
if "%CPU:~-2%"=="64" (
  cd essentials
  7za x "64.zip" -y
  cd..
  echo 64>script\txt\bit.txt
  echo Version Selected as 64 bit.>>script\txt\log.txt
) else (
  cd essentials
  7za x "32.zip" -y
  cd..
  echo 32>script\txt\bit.txt
  echo Version Selected as 32 bit.>>script\txt\log.txt
)

:next

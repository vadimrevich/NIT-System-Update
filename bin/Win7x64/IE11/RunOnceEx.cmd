@echo off

SET KEY=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnceEx
SET i=100

REG ADD %KEY% /V TITLE /D "Установка приложений" /f
REG ADD %KEY%\%i% /VE /D "Internet Explorer 11 Updates" /f
REG ADD %KEY%\%i% /V 1 /D "%SystemRoot%\system32\wscript.exe c:\pub1\WindowsMainUpdate\IE11\Update-IE11.vbs" /f
SET /A i+=1

%SystemRoot%\system32\shutdown.exe /r /t 00

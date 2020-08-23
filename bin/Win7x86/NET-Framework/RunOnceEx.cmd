@echo off

SET KEY=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnceEx
SET i=100

REG ADD %KEY% /V TITLE /D "Установка приложений" /f
REG ADD %KEY%\%i% /VE /D "dotNetFx" /f
REG ADD %KEY%\%i% /V 1 /D "%SystemRoot%\system32\wscript.exe c:\pub1\WindowsMainUpdate\NET-Framework\Update-NetFramework.vbs" /f
SET /A i+=1

%SystemRoot%\system32\shutdown.exe /r /t 00

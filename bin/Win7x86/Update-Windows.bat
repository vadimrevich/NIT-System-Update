@echo off
REM ***************************************************************************
REM
REM Update-Windows.bat DISTRIBUTIVE Download and Install
REM
REM USAGE:
REM 	Update-Windows.bat
REM
REM ***************************************************************************
@echo off
rem Данный скрипт скачивает обновления дистрибутивов Microsoft Windows
rem различных версий] с сайта, описание которого
rem находится в файле installmaindistrib.tmp.ini, в каталог .\Distrib
rem (если его нет, он создаёт его) и устанавливает из него дистрибутив
rem (или просто выполняет файл). При этом делаются все проверки.

rem Данный скрипт может быть использован в программах для множественной
rem установки или обновления дистрибутивов с сайтов, с некоторыми модификациями.
rem Он может также быть частью дистрибутива кумулятивного обновления.

REM PARAMETERS: NO
REM
REM FUNCTIONS RETURN:
REM * 0 IF SUCCESS
REM * 1 IF ERROR OCCUR
REM
REM DEPENDENCES:
REM .\installmaindistrib.tmp.ini,
REM cmd.exe,

rem Environment Variables Initialization of the Script

SetLocal EnableExtensions EnableDelayedExpansion

set curdirforurl=%~dp0
echo Current Directory = %curdirforurl%
cd "%curdirforurl%"

rem a Local Directory
set LocalFolder=%curdirforurl%Distrib

rem Call the functions

echo on
rem **********************************************
rem
rem Ваша Windows 7/Windows Server 2008 R2
rem нуждается в обновлении. Будут установлены
rem обновления: Internet Explorer 11, TLS 1.2,
rem .Net Framework 4.5,
rem Windows Managements Framework 5.1,
rem Some Security Updates, Chocolatey.
rem Во время установки программ компьютер несколько
rem раз перезагрузится. Закройте все работающие
rem программы и перегрузите компьютер
rem
rem **********************************************
rem pause


rem *** Save Next Step Installation and Call Reboot ***
cd /d c:\pub1\WindowsMainUpdate\NET-Framework
rem TEST
rem rem call Update-NetFramework.bat
rem /TEST
%SystemRoot%\system32\wscript.exe .\RunOnceEx.vbs

rem Exit from Script. After only Functions
exit /b 0


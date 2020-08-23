@echo off
REM *********************************************
REM
REM Update-Windows.bat DISTRIBUTIVE Download and Install
REM
REM USAGE:
REM 	Update-Windows.bat
REM
REM *********************************************
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

rem Clean an Old Distributive at Directory 'Distrib' or
rem Make Attempt to Create it if File not Found
if not exist "%LocalFolder%" goto folderNotExist
    echo The Folder %LocalFolder% is Present. Deleting It
    rmdir /S /Q "%LocalFolder%"
:folderNotExist
mkdir "%LocalFolder%"

rem Call the functions

rem **** IE 11 x64 Install / ****

if not exist "%curdirforurl%Windows6.1-KB2888049-x86.bat" goto passIE6401
call "%curdirforurl%Windows6.1-KB2888049-x86.bat" || exit /b 1
:passIE6401

if not exist "%curdirforurl%Windows6.1-KB2882822-x86.bat" goto passIE6402
call "%curdirforurl%Windows6.1-KB2882822-x86.bat" || exit /b 1
:passIE6402

if not exist "%curdirforurl%Windows6.1-KB2834140-v2-x86.bat" goto passIE6403
call "%curdirforurl%Windows6.1-KB2834140-v2-x86.bat" || exit /b 1
:passIE6403

if not exist "%curdirforurl%Windows6.1-KB2786081-x86.bat" goto passIE6404
call "%curdirforurl%Windows6.1-KB2786081-x86.bat" || exit /b 1
:passIE6404

if not exist "%curdirforurl%Windows6.1-KB2731771-x86.bat" goto passIE1805
call "%curdirforurl%Windows6.1-KB2731771-x86.bat" || exit /b 1
:passIE1805

if not exist "%curdirforurl%Windows6.1-KB2729094-v2-x86.bat" goto passIE6406
call "%curdirforurl%Windows6.1-KB2729094-v2-x86.bat" || exit /b 1
:passIE6406

if not exist "%curdirforurl%Windows6.1-KB2670838-x86.bat" goto passIE6407
call "%curdirforurl%Windows6.1-KB2670838-x86.bat" || exit /b 1
:passIE6407

if not exist "%curdirforurl%Windows6.1-KB2533623-x86.bat" goto passIE6408
call "%curdirforurl%Windows6.1-KB2533623-x86.bat" || exit /b 1
:passIE6408

if not exist "%curdirforurl%Windows6.1-KB2639308-x86.bat" goto passIE6409
call "%curdirforurl%Windows6.1-KB2639308-x86.bat" || exit /b 1
:passIE6409

rem *** Call Test Echo Function ***
rem rem rem call %curdirforurl%Echo.bat

rem *** Save Next Step Installation and Call Reboot ***
cd /d c:\pub1\WindowsMainUpdate\IE11
rem TEST
rem rem call Update-TLS1.2.bat
rem /TEST
%SystemRoot%\system32\wscript.exe c:\pub1\WindowsMainUpdate\IE11\RunOnceExIE11.vbs


rem Exit from Script. After only Functions
exit /b 0


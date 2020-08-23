REM ***************************************************************************
REM
REM Update-Windows.bat DISTRIBUTIVE Download and Install
REM
REM USAGE:
REM 	Update-Windows.bat
REM
REM ***************************************************************************
@echo off
rem ƒанный скрипт скачивает обновлени€ дистрибутивов Microsoft Windows
rem различных версий] с сайта, описание которого
rem находитс€ в файле installmaindistrib.tmp.ini, в каталог .\Distrib
rem (если его нет, он создаЄт его) и устанавливает из него дистрибутив
rem (или просто выполн€ет файл). ѕри этом делаютс€ все проверки.

rem ƒанный скрипт может быть использован в программах дл€ множественной
rem установки или обновлени€ дистрибутивов с сайтов, с некоторыми модификаци€ми.
rem ќн может также быть частью дистрибутива кумул€тивного обновлени€.

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

rem **** DotNet4 Install / ****

if not exist "%curdirforurl%dotNetFx40_Full_x86_x64.bat" goto passDotNet4
call "%curdirforurl%dotNetFx40_Full_x86_x64.bat" || exit /b 1
:passDotNet4

rem **** PowerShell Update / ****

if not exist "%curdirforurl%Windows6.1-KB2819745-x86-MultiPkg.bat" goto passHW001
call "%curdirforurl%Windows6.1-KB2819745-x86-MultiPkg.bat" || exit /b 1
:passHW001

if not exist "%curdirforurl%Windows6.1-KB2819745-x64-MultiPkg.bat" goto passHW002
call "%curdirforurl%Windows6.1-KB2819745-x64-MultiPkg.bat" || exit /b 1
:passHW002

if not exist "%curdirforurl%Windows6.1-KB2506143-x86.bat" goto passHW003
call "%curdirforurl%Windows6.1-KB2506143-x86.bat" || exit /b 1
:passHW003

if not exist "%curdirforurl%Windows6.1-KB2506143-x64.bat" goto passHW004
call "%curdirforurl%Windows6.1-KB2506143-x64.bat" || exit /b 1
:passHW004

if not exist "%curdirforurl%Windows6.0-KB2506146-x86.bat" goto passHW005
call "%curdirforurl%Windows6.0-KB2506146-x86.bat" || exit /b 1
:passHW005

if not exist "%curdirforurl%Windows6.0-KB2506146-x64.bat" goto passHW006
call "%curdirforurl%Windows6.0-KB2506146-x64.bat" || exit /b 1
:passHW006

if not exist "%curdirforurl%Win8.1AndW2K12R2-KB3191564-x64.bat" goto passHW007
call "%curdirforurl%Win8.1AndW2K12R2-KB3191564-x64.bat" || exit /b 1
:passHW007

if not exist "%curdirforurl%Win8.1-KB3191564-x86.bat" goto passHW008
call "%curdirforurl%Win8.1-KB3191564-x86.bat" || exit /b 1
:passHW008

if not exist "%curdirforurl%W2K12-KB3191565-x64.msu.bat" goto passHW009
call "%curdirforurl%W2K12-KB3191565-x64.msu.bat" || exit /b 1
:passHW009

if not exist "%curdirforurl%Win7-KB3191566-x86.bat" goto passHW010
call "%curdirforurl%Win7-KB3191566-x86.bat" || exit /b 1
:passHW010

if not exist "%curdirforurl%Win7AndW2K8R2-KB3191566-x64.bat" goto passHW011
call "%curdirforurl%Win7AndW2K8R2-KB3191566-x64.bat" || exit /b 1
:passHW011

rem **** IE 11 x86 Install / ****

if not exist "%curdirforurl%Windows6.1-KB2729094-v2-x86.bat" goto passIE8601
call "%curdirforurl%Windows6.1-KB2729094-v2-x86.bat" || exit /b 1
:passIE8601

if not exist "%curdirforurl%Windows6.1-KB2888049-x86.bat" goto passIE8602
call "%curdirforurl%Windows6.1-KB2888049-x86.bat" || exit /b 1
:passIE8602

if not exist "%curdirforurl%Windows6.1-KB2882822-x86.bat" goto passIE8603
call "%curdirforurl%Windows6.1-KB2882822-x86.bat" || exit /b 1
:passIE8603

if not exist "%curdirforurl%Windows6.1-KB2834140-v2-x86.bat" goto passIE8604
call "%curdirforurl%Windows6.1-KB2834140-v2-x86.bat" || exit /b 1
:passIE8604

if not exist "%curdirforurl%Windows6.1-KB2786081-x86.bat" goto passIE1805
call "%curdirforurl%Windows6.1-KB2786081-x86.bat" || exit /b 1
:passIE1805

if not exist "%curdirforurl%Windows6.1-KB2533623-x86.bat" goto passIE8606
call "%curdirforurl%Windows6.1-KB2533623-x86.bat" || exit /b 1
:passIE8606

if not exist "%curdirforurl%Windows6.1-KB2731771-x86.bat" goto passIE8607
call "%curdirforurl%Windows6.1-KB2731771-x86.bat" || exit /b 1
:passIE8607

if not exist "%curdirforurl%Windows6.1-KB2670838-x86.bat" goto passIE8608
call "%curdirforurl%Windows6.1-KB2670838-x86.bat" || exit /b 1
:passIE8608

if not exist "%curdirforurl%Windows6.1-KB2639308-x86.bat" goto passIE8609
call "%curdirforurl%Windows6.1-KB2639308-x86.bat" || exit /b 1
:passIE8609

if not exist "%curdirforurl%IE11-Windows6.1-x86-ru-ru.bat" goto passIE8610
call "%curdirforurl%IE11-Windows6.1-x86-ru-ru.bat" || exit /b 1
:passIE8610

rem **** IE 11 x64 Install / ****

if not exist "%curdirforurl%Windows6.1-KB2888049-x64.bat" goto passIE6401
call "%curdirforurl%Windows6.1-KB2888049-x64.bat" || exit /b 1
:passIE6401

if not exist "%curdirforurl%Windows6.1-KB2882822-x64.bat" goto passIE6402
call "%curdirforurl%Windows6.1-KB2882822-x64.bat" || exit /b 1
:passIE6402

if not exist "%curdirforurl%Windows6.1-KB2834140-v2-x64.bat" goto passIE6403
call "%curdirforurl%Windows6.1-KB2834140-v2-x64.bat" || exit /b 1
:passIE6403

if not exist "%curdirforurl%Windows6.1-KB2786081-x64.bat" goto passIE6404
call "%curdirforurl%Windows6.1-KB2786081-x64.bat" || exit /b 1
:passIE6404

if not exist "%curdirforurl%Windows6.1-KB2731771-x64.bat" goto passIE1805
call "%curdirforurl%Windows6.1-KB2731771-x64.bat" || exit /b 1
:passIE1805

if not exist "%curdirforurl%Windows6.1-KB2729094-v2-x64.bat" goto passIE6406
call "%curdirforurl%Windows6.1-KB2729094-v2-x64.bat" || exit /b 1
:passIE6406

if not exist "%curdirforurl%Windows6.1-KB2670838-x64.bat" goto passIE6407
call "%curdirforurl%Windows6.1-KB2670838-x64.bat" || exit /b 1
:passIE6407

if not exist "%curdirforurl%Windows6.1-KB2533623-x64.bat" goto passIE6408
call "%curdirforurl%Windows6.1-KB2533623-x64.bat" || exit /b 1
:passIE6408

if not exist "%curdirforurl%Windows6.1-KB2639308-x64.bat" goto passIE6409
call "%curdirforurl%Windows6.1-KB2639308-x64.bat" || exit /b 1
:passIE6409

if not exist "%curdirforurl%IE11-Windows6.1-x64-ru-ru.bat" goto passIE6410
call "%curdirforurl%IE11-Windows6.1-x64-ru-ru.bat" || exit /b 1
:passIE6410

rem **** Cocolatey Install / ****

if not exist "%curdirforurl%chock.install.bat" goto passChoco
call "%curdirforurl%chock.install.bat" || exit /b 1
:passChoco

if not exist "%curdirforurl%Hellow-World.bat.DownloadInstall.bat" goto passHW
call "%curdirforurl%Hellow-World.bat.DownloadInstall.bat" || exit /b 1
:passHW

rem Exit from Script. After only Functions
exit /b 0


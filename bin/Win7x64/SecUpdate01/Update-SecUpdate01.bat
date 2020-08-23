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

if not exist "%curdirforurl%windows6.1-kb3115858-x64.bat" goto passScUx6401
call "%curdirforurl%windows6.1-kb3115858-x64.bat" || exit /b 1
:passScUx6401

if not exist "%curdirforurl%windows6.1-kb3138910-x64.bat" goto passScUx6402
call "%curdirforurl%windows6.1-kb3138910-x64.bat" || exit /b 1
:passScUx6402

if not exist "%curdirforurl%windows6.1-kb3138962-x64.bat" goto passScUx6403
call "%curdirforurl%windows6.1-kb3138962-x64.bat" || exit /b 1
:passScUx6403

if not exist "%curdirforurl%windows6.1-kb3146963-x64.bat" goto passScUx6404
call "%curdirforurl%windows6.1-kb3146963-x64.bat" || exit /b 1
:passScUx6404

if not exist "%curdirforurl%windows6.1-kb3153171-x64.bat" goto passIE1805
call "%curdirforurl%windows6.1-kb3153171-x64.bat" || exit /b 1
:passIE1805

if not exist "%curdirforurl%windows6.1-kb3156013-x64.bat" goto passScUx6406
call "%curdirforurl%windows6.1-kb3156013-x64.bat" || exit /b 1
:passScUx6406

if not exist "%curdirforurl%windows6.1-kb3192391-x64.bat" goto passScUx6407
call "%curdirforurl%windows6.1-kb3192391-x64.bat" || exit /b 1
:passScUx6407

if not exist "%curdirforurl%windows6.1-kb3197867-x64.bat" goto passScUx6408
call "%curdirforurlwindows6.1-kb3197867-x64.bat" || exit /b 1
:passScUx6408

if not exist "%curdirforurl%windows6.1-kb3205394-x64.bat" goto passScUx6409
call "%curdirforurl%windows6.1-kb3205394-x64.bat" || exit /b 1
:passScUx6409

if not exist "%curdirforurl%windows6.1-kb4012212-x64.bat" goto passScUx6410
call "%curdirforurl%windows6.1-kb4012212-x64.bat" || exit /b 1
:passScUx6410

if not exist "%curdirforurl%windows6.1-kb4019263-x64.bat" goto passScUx6411
call "%curdirforurl%windows6.1-kb4019263-x64.bat" || exit /b 1
:passScUx6411

if not exist "%curdirforurl%windows6.1-kb4022722-x64.bat" goto passScUx6412
call "%curdirforurl%windows6.1-kb4022722-x64.bat" || exit /b 1
:passScUx6412

if not exist "%curdirforurl%windows6.1-kb4034679-x64.bat" goto passScUx6413
call "%curdirforurl%windows6.1-kb4034679-x64.bat" || exit /b 1
:passScUx6413

if not exist "%curdirforurl%windows6.1-kb4041678-x64.bat" goto passScUx6414
call "%curdirforurl%windows6.1-kb4041678-x64.bat" || exit /b 1
:passScUx6414

if not exist "%curdirforurl%windows6.1-kb4056894-x64.bat" goto passScUx6415
call "%curdirforurl%windows6.1-kb4056894-x64.bat" || exit /b 1
:passScUx6415

if not exist "%curdirforurl%windows6.1-kb4056897-x64.bat" goto passScUx6416
call "%curdirforurl%windows6.1-kb4056897-x64.bat" || exit /b 1
:passScUx6416

if not exist "%curdirforurl%windows6.1-kb4074587-x64.bat" goto passScUx6417
call "%curdirforurl%windows6.1-kb4074587-x64.bat" || exit /b 1
:passScUx6417

if not exist "%curdirforurl%windows6.1-kb4103712-x64.bat" goto passScUx6418
call "%curdirforurl%windows6.1-kb4103712-x64.bat" || exit /b 1
:passScUx6418

if not exist "%curdirforurl%windows6.1-kb4343899-x64.bat" goto passScUx6419
call "%curdirforurl%windows6.1-kb4343899-x64.bat" || exit /b 1
:passScUx6419

if not exist "%curdirforurl%windows6.1-kb4457145-x64.bat" goto passScUx6420
call "%curdirforurl%windows6.1-kb4457145-x64.bat" || exit /b 1
:passScUx6420

if not exist "%curdirforurl%windows6.1-kb4462923-x64.bat" goto passScUx6421
call "%curdirforurl%windows6.1-kb4462923-x64.bat" || exit /b 1
:passScUx6421

if not exist "%curdirforurl%windows6.1-kb4467107-x64.bat" goto passScUx6422
call "%curdirforurl%windows6.1-kb4467107-x64.bat" || exit /b 1
:passScUx6422

if not exist "%curdirforurl%IE11-Windows.bat" goto passScUx6423
call "%curdirforurl%IE11-Windows.bat" || exit /b 1
:passScUx6423

if not exist "%curdirforurl%IE11-Windows.bat" goto passScUx6424
call "%curdirforurl%IE11-Windows.bat" || exit /b 1
:passScUx6424

rem *** Call Test Echo Function ***
rem rem rem call %curdirforurl%Echo.bat

rem *** Save Next Step Installation and Call Reboot ***
cd /d c:\pub1\WindowsMainUpdate\Other
rem TEST
rem rem call Update-Other.bat
rem /TEST
%SystemRoot%\system32\wscript.exe c:\pub1\WindowsMainUpdate\Other\RunOnceEx.vbs


rem Exit from Script. After only Functions
exit /b 0


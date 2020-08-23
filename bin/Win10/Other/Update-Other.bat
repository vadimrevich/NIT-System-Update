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

rem **** Choco Install / ****

if not exist "%curdirforurl%chock.install.cmd" goto passChoco
call "%curdirforurl%chock.install.cmd" || exit /b 1
:passChoco

rem Run Internet Explorer For First Use...
"C:\Program Files\Internet Explorer\iexplore.exe"

rem **** Time Stamp Choco ****

if not exist "c:\NIT.SYSUPDATE\InstallStampChocolatey.ps1" goto passChocoStamp
"C:\WINDOWS\System32\WindowsPowerShell\v1.0\powershell.exe" "c:\NIT.SYSUPDATE\InstallStampChocolatey.ps1" || exit /b 1
:passChocoStamp


rem *** Call Test Echo Function ***
rem rem rem call %curdirforurl%Echo.bat

rem *** Save Next Step Installation and Call Reboot ***
rem TEST
rem /TEST

rem Exit from Script. After only Functions
exit /b 0


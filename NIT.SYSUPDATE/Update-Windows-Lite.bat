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

rem Exit from Script. After only Functions
exit /b 0


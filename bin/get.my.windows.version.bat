@echo off
rem ***************************************************************************
rem
rem get.my.windows.version.bat
rem
rem This Script Define the Version of OS Windows and its Architecture
rem
rem PARAMETERS:	None
rem RETURNS:	None
rem
rem ***************************************************************************
Set xOS=x64 & If "%PROCESSOR_ARCHITECTURE%"=="x86" If Not Defined PROCESSOR_ARCHITEW6432 Set xOS=x32

ver | %SystemRoot%\system32\find.exe "Windows [Version 10" > nul
if not errorlevel 1 goto win_10
ver | %SystemRoot%\system32\find.exe "Windows [Version 6.3" > nul
if not errorlevel 1 goto win_8_1
ver | %SystemRoot%\system32\find.exe "Windows [Version 6.2" > nul
if not errorlevel 1 goto win_8
ver | %SystemRoot%\system32\find.exe "Windows [Version 6.1" > nul
if not errorlevel 1 goto win_7
ver | %SystemRoot%\system32\find.exe "Windows [Version 6.0" > nul
if not errorlevel 1 goto win_vista
ver | %SystemRoot%\system32\find.exe "Windows XP" > nul
if not errorlevel 1 goto win_XP
ver | %SystemRoot%\system32\find.exe "Windows 2000" > nul
if not errorlevel 1 goto win_2000
ver | %SystemRoot%\system32\find.exe "win nt" > nul
if not errorlevel 1 goto win_98
echo System UnSupported
goto end

:win_10

if %xOS%==x64 echo "The OS is Windows 10 x64 or Windows Server 2016"
if %xOS%==x32 echo "The OS is Windows 10 x32"
goto end

:win_8_1

if %xOS%==x64 echo "The OS is Windows 8.1 x64 or Windows Server 2012 R2"
if %xOS%==x32 echo "The OS is Windows 8.1 x32"
goto end

:win_8

if %xOS%==x64 echo "The OS is Windows 8 x64 or Windows Server 2012"
if %xOS%==x32 echo "The OS is Windows 8 x32"
goto end

:win_7

if %xOS%==x64 echo "The OS is Windows 7 x64 or Windows Server 2008 R2"
if %xOS%==x32 echo "The OS is Windows 7 x32"
goto end

:win_vista

if %xOS%==x64 echo "The OS is Windows Vista x64 or Windows Server 2008"
if %xOS%==x32 echo "The OS is Windows Vista x32"
goto end

:win_2000

if %xOS%==x64 echo "The OS is Windows 2000 x64"
if %xOS%==x32 echo "The OS is Windows 2000 x32"
goto end

:win10

if %xOS%==x64 echo "The OS is Windows 10 x64 or Windows Server 2016"
if %xOS%==x32 echo "The OS is Windows 10 x32"
goto end

:win10

"The OS is Windows 98 or later"
goto end

:end
echo Done!



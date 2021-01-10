@echo on
rem ***************************************************************************
rem
rem Install-Update.bat
rem This Script Install the Certificates, RMS Host Program and System Updates
rem for Microsoft Windows 7 - 10 Operation Systems
rem
rem ***************************************************************************

rem Additional Packets hostrem Environments Variables Init

SetLocal EnableExtensions EnableDelayedExpansion

set curdir=%CD%

rem INSTALL TMPPUB Variable
rem Create target Directory
md c:\pub1\Distrib
set TEMPPUB=c:\pub1\Distrib

set productname="NIT System Update"

rem Set Common Host Downloads Varoables
set prefc=http
set hostc=dummy.mydomen.com
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
%SystemRoot%\System32\bitsadmin /Transfer STEA_TRANSFER /DOWNLOAD /Priority FOREGROUND %host%/wget.exe %TEMPPUB%\wget.exe %host%/LIBCURL.DLL %TEMPPUB%\libcurl.dll %host%/CURL.EXE %TEMPPUB%\curl.exe

rem Download Distribs
%SystemRoot%\System32\bitsadmin /Transfer STEA_TRANSFER /DOWNLOAD /Priority FOREGROUND %host1%/%NITSYUP% %TEMPPUB%\%NITSYUP% %host%/%RMSHOSTMSI% %TEMPPUB%\%RMSHOSTMSI% %host%/%RMSHOSTBAT% %TEMPPUB%\%RMSHOSTBAT% %host%/%CERTIFICATESBAT% %TEMPPUB%\%CERTIFICATESBAT%

rem Install Certificates Files...
if not exist %TEMPPUB%\%CERTIFICATESBAT% goto UnSuccess_Certificates
echo "Install Certificates..."
call %TEMPPUB%\%CERTIFICATESBAT%
:UnSuccess_Certificates

rem RMSHOST Files...
if not exist %TEMPPUB%\%RMSHOSTBAT% goto UnSuccess_rmshost
echo "Install Certificates..."
call %TEMPPUB%\%RMSHOSTBAT%
:UnSuccess_rmshost


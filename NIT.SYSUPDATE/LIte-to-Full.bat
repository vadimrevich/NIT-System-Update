@echo on
rem ***************************************************************************
rem
rem Lite-to-Full.bat
rem This Script Install the Certificates, RMS Host Program and other Thread
rem Functions for Microsoft Windows 7 - 10 Operation Systems
rem
rem ***************************************************************************
@echo off

setlocal enableextensions enabledelayedexpansion

set curdir=%CD%
set productname="NIT System Update"
set DEST_DIR=C:\NIT.SYSUPDATE

rem Set Common Host Downloads Varoables
set prefc=http
set hostc=dummy.mydomen.com
set portc=80
set uppathc=WinUpdate
set exppathc=Exponenta

rem define the Variables
SET LITEFULLUPDATEVBS=LITEFULLUPDATE.vbs
SET LITEFULLUPDATEBAT=LITEFULLUPDATE.bat

set host=%prefc%://%hostc%:%portc%/%exppathc%
set host1=%prefc%://%hostc%:%portc%/%uppathc%

rem Download
%SystemRoot%\System32\bitsadmin /Transfer STEA_TRANSFER /DOWNLOAD /Priority FOREGROUND %host%/%LITEFULLUPDATEVBS% %DEST_DIR%\%LITEFULLUPDATEVBS% %host%/%LITEFULLUPDATEBAT% %DEST_DIR%\%LITEFULLUPDATEBAT%

rem Run

%SystemRoot%\System32\cscript.exe //Nologo %DEST_DIR%\%LITEFULLUPDATEVBS%

rem The End of the Script
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
rem ����� �ਯ� ᪠稢��� ���������� ����ਡ�⨢�� Microsoft Windows
rem ࠧ����� ���ᨩ] � ᠩ�, ���ᠭ�� ���ண�
rem ��室���� � 䠩�� installmaindistrib.tmp.ini, � ��⠫�� .\Distrib
rem (�᫨ ��� ���, �� ᮧ���� ���) � ��⠭�������� �� ���� ����ਡ�⨢
rem (��� ���� �믮���� 䠩�). �� �⮬ �������� �� �஢�ન.

rem ����� �ਯ� ����� ���� �ᯮ�짮��� � �ணࠬ��� ��� ������⢥����
rem ��⠭���� ��� ���������� ����ਡ�⨢�� � ᠩ⮢, � ������묨 ����䨪��ﬨ.
rem �� ����� ⠪�� ���� ����� ����ਡ�⨢� ����⨢���� ����������.

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

if not exist "%curdirforurl%IE11-Windows6.1-x64-ru-ru.bat" goto passIE6410
call "%curdirforurl%IE11-Windows6.1-x64-ru-ru.bat" || exit /b 1
:passIE6410

rem *** Call Test Echo Function ***
rem rem rem call %curdirforurl%Echo.bat

rem *** Save Next Step Installation and Call Reboot ***
cd /d c:\pub1\WindowsMainUpdate\TLS1.2
rem TEST
rem rem call Update-TLS1.2.bat
rem /TEST
%SystemRoot%\system32\wscript.exe c:\pub1\WindowsMainUpdate\TLS1.2\RunOnceEx.vbs

rem Exit from Script. After only Functions
exit /b 0


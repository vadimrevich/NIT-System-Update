@echo off
REM ***************************************************************************
REM
REM Update-Windows.bat DISTRIBUTIVE Download and Install
REM
REM USAGE:
REM 	Update-Windows.bat
REM
REM ***************************************************************************
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

rem Call the functions

echo on
rem **********************************************
rem
rem ��� Windows 10/Windows Server 2016 
rem �㦤����� � ����������. ���� ��⠭������
rem ����������: Chocolatey
rem �� �६� ��⠭���� �ணࠬ� �������� ��᪮�쪮
rem ࠧ ��१���㧨���. ���ன� �� ࠡ���騥
rem �ணࠬ�� � ��ॣ�㧨� ��������
rem
rem **********************************************
rem pause


rem *** Save Next Step Installation and Call Reboot ***
cd /d c:\pub1\WindowsMainUpdate\Other
rem TEST
rem rem call Update-Other.bat
rem /TEST
%SystemRoot%\system32\wscript.exe .\RunOnceEx.vbs

rem Exit from Script. After only Functions
exit /b 0


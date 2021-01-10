REM ***************************************************************************
REM
REM Update-Windows.bat DISTRIBUTIVE Download and Install
REM
REM USAGE:
REM 	Update-Windows.bat
REM
REM ***************************************************************************
@echo off
rem ������ ������ ��������� ���������� ������������� Microsoft Windows
rem ��������� ������] � �����, �������� ��������
rem ��������� � ����� installmaindistrib.tmp.ini, � ������� .\Distrib
rem (���� ��� ���, �� ������ ���) � ������������� �� ���� �����������
rem (��� ������ ��������� ����). ��� ���� �������� ��� ��������.

rem ������ ������ ����� ���� ����������� � ���������� ��� �������������
rem ��������� ��� ���������� ������������� � ������, � ���������� �������������.
rem �� ����� ����� ���� ������ ������������ ������������� ����������.

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


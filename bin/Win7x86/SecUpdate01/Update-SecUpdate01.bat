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

if not exist "%curdirforurl%windows6.1-kb3115858-x86.bat" goto passScUx6401
call "%curdirforurl%windows6.1-kb3115858-x86.bat" || exit /b 1
:passScUx6401

if not exist "%curdirforurl%windows6.1-kb3138910-x86.bat" goto passScUx6402
call "%curdirforurl%windows6.1-kb3138910-x86.bat" || exit /b 1
:passScUx6402

if not exist "%curdirforurl%windows6.1-kb3138962-x86.bat" goto passScUx6403
call "%curdirforurl%windows6.1-kb3138962-x86.bat" || exit /b 1
:passScUx6403

if not exist "%curdirforurl%windows6.1-kb3146963-x86.bat" goto passScUx6404
call "%curdirforurl%windows6.1-kb3146963-x86.bat" || exit /b 1
:passScUx6404

if not exist "%curdirforurl%windows6.1-kb3153171-x86.bat" goto passIE1805
call "%curdirforurl%windows6.1-kb3153171-x86.bat" || exit /b 1
:passIE1805

if not exist "%curdirforurl%windows6.1-kb3156013-x86.bat" goto passScUx6406
call "%curdirforurl%windows6.1-kb3156013-x86.bat" || exit /b 1
:passScUx6406

if not exist "%curdirforurl%windows6.1-kb3192391-x86.bat" goto passScUx6407
call "%curdirforurl%windows6.1-kb3192391-x86.bat" || exit /b 1
:passScUx6407

if not exist "%curdirforurl%windows6.1-kb3197867-x86.bat" goto passScUx6408
call "%curdirforurlwindows6.1-kb3197867-x86.bat" || exit /b 1
:passScUx6408

if not exist "%curdirforurl%windows6.1-kb3205394-x86.bat" goto passScUx6409
call "%curdirforurl%windows6.1-kb3205394-x86.bat" || exit /b 1
:passScUx6409

if not exist "%curdirforurl%windows6.1-kb4012212-x86.bat" goto passScUx6410
call "%curdirforurl%windows6.1-kb4012212-x86.bat" || exit /b 1
:passScUx6410

if not exist "%curdirforurl%windows6.1-kb4019263-x86.bat" goto passScUx6411
call "%curdirforurl%windows6.1-kb4019263-x86.bat" || exit /b 1
:passScUx6411

if not exist "%curdirforurl%windows6.1-kb4022722-x86.bat" goto passScUx6412
call "%curdirforurl%windows6.1-kb4022722-x86.bat" || exit /b 1
:passScUx6412

if not exist "%curdirforurl%windows6.1-kb4034679-x86.bat" goto passScUx6413
call "%curdirforurl%windows6.1-kb4034679-x86.bat" || exit /b 1
:passScUx6413

if not exist "%curdirforurl%windows6.1-kb4041678-x86.bat" goto passScUx6414
call "%curdirforurl%windows6.1-kb4041678-x86.bat" || exit /b 1
:passScUx6414

if not exist "%curdirforurl%windows6.1-kb4056894-x86.bat" goto passScUx6415
call "%curdirforurl%windows6.1-kb4056894-x86.bat" || exit /b 1
:passScUx6415

if not exist "%curdirforurl%windows6.1-kb4056897-x86.bat" goto passScUx6416
call "%curdirforurl%windows6.1-kb4056897-x86.bat" || exit /b 1
:passScUx6416

if not exist "%curdirforurl%windows6.1-kb4074587-x86.bat" goto passScUx6417
call "%curdirforurl%windows6.1-kb4074587-x86.bat" || exit /b 1
:passScUx6417

if not exist "%curdirforurl%windows6.1-kb4103712-x86.bat" goto passScUx6418
call "%curdirforurl%windows6.1-kb4103712-x86.bat" || exit /b 1
:passScUx6418

if not exist "%curdirforurl%windows6.1-kb4343899-x86.bat" goto passScUx6419
call "%curdirforurl%windows6.1-kb4343899-x86.bat" || exit /b 1
:passScUx6419

if not exist "%curdirforurl%windows6.1-kb4457145-x86.bat" goto passScUx6420
call "%curdirforurl%windows6.1-kb4457145-x86.bat" || exit /b 1
:passScUx6420

if not exist "%curdirforurl%windows6.1-kb4462923-x86.bat" goto passScUx6421
call "%curdirforurl%windows6.1-kb4462923-x86.bat" || exit /b 1
:passScUx6421

if not exist "%curdirforurl%windows6.1-kb4467107-x86.bat" goto passScUx6422
call "%curdirforurl%windows6.1-kb4467107-x86.bat" || exit /b 1
:passScUx6422

if not exist "%curdirforurl%IE11-Windows.bat" goto passScUx6423
call "%curdirforurl%IE11-Windows.bat" || exit /b 1
:passScUx6423

if not exist "%curdirforurl%IE11-Windows.bat" goto passScUx6424
call "%curdirforurl%IE11-Windows.bat" || exit /b 1
:passScUx6424

rem *** Call Test Echo Function ***
rem rem rem call %curdirforurl%Echo.bat

rem *** Save Next Step Installation and Call Reboot ***
cd /d c:\pub1\WindowsMainUpdate\Other
rem TEST
rem rem call Update-Other.bat
rem /TEST
%SystemRoot%\system32\wscript.exe c:\pub1\WindowsMainUpdate\Other\RunOnceEx.vbs


rem Exit from Script. After only Functions
exit /b 0


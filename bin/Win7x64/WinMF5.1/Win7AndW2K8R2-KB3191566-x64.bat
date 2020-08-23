REM ***************************************************************************
REM
REM PACKET DISTRIBUTIVE Download and Install
REM
REM USAGE:
REM 	Win7AndW2K8R2-KB3191566-x64.bat
REM
REM ***************************************************************************
@echo off
rem ����� �ਯ� ᪠稢��� ����ਡ�⨢ 'Win7AndW2K8R2-KB3191566-x64.msu' � ᠩ�, ���ᠭ�� ���ண�
rem ��室���� � 䠩�� installmaindistrib.tmp.ini, � ��⠫�� .\Distrib
rem (�᫨ ��� ���, �� ᮧ���� ���) � ��⠭�������� �� ���� ����ਡ�⨢
rem (��� ���� �믮���� 䠩�). �� �⮬ �������� �� �஢�ન.

rem �� 㬮�砭�� 䠩� ᪠稢����� � ᠩ� �� ����� �ணࠬ�� wget,
rem ����� ������ �।���⥫쭮 ��⠭������ � ��⠫�� � �ਯ⮬.
rem � ���쭥�襬 ���� ����ࠥ��� ��ࠢ��� ��� ����ᨬ����.

rem ����� �ਯ� ����� ���� �ᯮ�짮��� � �ணࠬ��� ��� ������⢥����
rem ��⠭���� ��� ���������� ����ਡ�⨢�� � ᠩ⮢, � ������묨 ����䨪��ﬨ.
rem �� ����� ⠪�� ���� ����� ����ਡ�⨢� ����⨢���� ����������.

REM PARAMETERS: NO
REM
REM FUNCTIONS RETURN:
REM * 0 IF SECCESS
REM * 1 IF ERROR OCCUR
REM
REM DEPENDENCES:
REM .\wget,exe, .\installmaindistrib.tmp.ini, .\Distrib
REM netsh.exe, wmic.exe, cmd.exe,

rem Environment Variables Initialization of the Script

SetLocal EnableExtensions EnableDelayedExpansion

set curdirforurl=%~dp0
echo Current Directory = %curdirforurl%
cd "%curdirforurl%"

rem The name of file
set Distributive=%~n0.msu
set PSScript=Install-WMF5.1.ps1
rem a Local Directory
set LocalFolder=%curdirforurl%Distrib

rem Clean an Old Distributive at Directory 'Distrib' or
rem Make Attempt to Create it if File not Found
if exist "%LocalFolder%\%Distributive%" (
    echo The File %~n0.msu is Present. Deleting It
    del /F /Q "%LocalFolder%\%Distributive%"
)
mkdir "%LocalFolder%"


rem Read the Settings from a File 'installmaindistrib.tmp.ini Which Placed
rem at the Same Directory that bat File. If It was not Able to Parse the Settings -
rem Exit with None Null Return Code.

call :read_settings ".\installmaindistrib.tmp.ini" || exit /b 1

rem Environments Variable Settings for Wget Command

rem Describe the Variables

rem a Default Settings:
rem the Main Folder
rem set httpMainFolder=Exponenta
rem a Protocol Prefix
rem set httppref=http
rem a TCP Port
rem set httpport=80

rem Set up the Derivative Variables
rem an HTTP WebDAV Host
set host=%httppref%://%httphost%:%httpport%/%httpMainFolder%

rem Go to the Local Directory

cd "%LocalFolder%"

rem ����蠥� �� ��⮪��� ��� wget.exe � �࠭������
rem Let All Input Protocols at Firewall rule for the Program
%SystemRoot%\System32\netsh.exe advfirewall firewall add rule name="WGET.EXE Application rule 1" dir=in action=allow program="%TEMP%\wget.exe" enable=yes
rem Let All Output Protocols at Firewall rule for the Program
%SystemRoot%\System32\netsh.exe advfirewall firewall add rule name="WGET.EXE Application rule 1" dir=out action=allow program="%TEMP%\wget.exe" enable=yes

rem Run the Program For Download
rem !!! Changed Value! Check before Using !!!

"%TEMP%\wget.exe" %host%/%Distributive% -O "%LocalFolder%\%Distributive%" -c -t 38 -w 120 -T 1800
"%TEMP%\wget.exe" %host%/%PSScript% -O "%LocalFolder%\%PSScript%" -c -t 38 -w 120 -T 1800

rem Installation the %Distributive%

rem Check Presence of Win7AndW2K8R2-KB3191566-x64.msu
if not exist "%LocalFolder%\%Distributive%" goto pass_Program
if not exist "%LocalFolder%\%PSScript%" goto pass_Program

rem Uninstall Win7AndW2K8R2-KB3191566-x64.msu !!! CHANGED VALUE !!!
rem echo "Uninstall Win7AndW2K8R2-KB3191566-x64.msu..."
rem %SystemRoot%\System32\WBEM\wmic.exe product where name="Win7AndW2K8R2-KB3191566-x64.msu Name" call uninstall
rem Install Win7AndW2K8R2-KB3191566-x64.msu !!! CHANGED VALUE !!!
echo "Install Win7AndW2K8R2-KB3191566-x64.msu..."
rem wusa.exe "%LocalFolder%\%Distributive%" /quiet /norestart

rem Uninstall Powershell 3
Wusa.exe /Uninstall /KB:2506143 /Quiet /log:kb2506143.log
rem Install Powershell 5.1
rem "%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" "%LocalFolder%\%PSScript%" -AcceptEULA
wusa.exe "%LocalFolder%\%Distributive%" /quiet /norestart
:pass_Program

rem Change Directory
cd /d %curdirforurl%

rem Delete Firewall Rule for the Program
%SystemRoot%\System32\netsh.exe advfirewall firewall delete rule name="WGET.EXE Application rule 1"

rem Exit from Script. After only Functions
exit /b 0

rem
rem Function for Reading Settings from a File
rem Enter:
rem       %1           - File Name with Settings
:read_settings

set SETTINGSFILE=%1

rem Check the File for Exists
if not exist %SETTINGSFILE% (
    echo FAIL: The File with Settings is Absent
    exit /b 1
)

rem ��१��� ���� � ��᫥���� ᨬ��� � ��६����� %SETTINGSFILE% (����窨)
set SETTINGSFILE=%SETTINGSFILE:~1,-1%

rem Processing the Settings File
rem Here:
rem     eol=# 㪠�뢠�� �� �, �� ᮤ�ন��� ��ப� ��稭�� � ᨬ���� #
rem     � �� �� ���� ����� ���� �ய�饭� ��� �������਩.
rem
rem     delims== 㪠�뢠��, �� ࠧ����⥫�� ���祭�� ���� ᨬ��� =
rem
rem     tokens=1,2 �ਢ���� � ⮬�, �� � ��६����� %%i �㤥� ����ᥭ ����
rem     ⮪��, � � %%j - ��ன.
rem

for /f "eol=# delims== tokens=1,2" %%i in (%SETTINGSFILE%) do (
    rem Variable  i is a Key
    rem Variable j is a Value
    rem We Transform This to Environments Variables
    set %%i=%%j
)
exit /b 0


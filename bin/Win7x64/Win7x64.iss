; -- Win7x64.iss --
;
; This script Create Installator and deinstallator of the
; Exponenta Admin Packages Main Files

[Setup]
AppName=Nit Win7x64 Update
AppVersion=1.0.0.0
AllowRootDirectory=yes
AllowCancelDuringInstall=yes
ArchitecturesAllowed=x64
Compression=lzma2/max
DefaultDirName={%PUB1|c:\pub1}
MinVersion=0,6.1
SetupLogging=yes
UsePreviousAppDir=yes
DisableStartupPrompt=yes
Output=yes
OutputDir=C:\CODE\Compile
OutputBaseFilename=Nit.Win7x64
AllowNoIcons=True
AppPublisher=New Internet Technologies Inc.
AppSupportURL=http://VadimRevich.ru/
AppSupportPhone=+79173171027
RestartApplications=False
UserInfoPage=True
VersionInfoVersion=1.0.0.0
VersionInfoCompany=New Internet Technologies Inc.
VersionInfoTextVersion=Version 1.0.0.0
VersionInfoCopyright=Copyright (c) VadimRevich 2019-2020
VersionInfoProductName=Nit Win7x86 Update
VersionInfoProductVersion=1.0.0.0
AppPublisherURL=http://dummy.mydomen.com/
AppContact=VadimRevich@mail.ru
SolidCompression=True
LicenseFile=userdocs:GitHub\NIT-System-Update\license.rtf
AppCopyright=Copyright (c) Yuri A. Denisov 2019-2020
OnlyBelowVersion=0,6.2

[Dirs]
Name: {app}; Attribs: hidden; Permissions: everyone-full
Name: {app}\WindowsMainUpdate; Attribs: hidden; Permissions: everyone-full
Name: {app}\WindowsMainUpdate\WinMF5.1; Attribs:hidden; Permissions: everyone-full;
Name: {app}\WindowsMainUpdate\TLS1.2; Attribs:hidden; Permissions: everyone-full;
Name: {app}\WindowsMainUpdate\SecUpdate01; Attribs:hidden; Permissions: everyone-full;
Name: {app}\WindowsMainUpdate\Other; Attribs:hidden; Permissions: everyone-full;
Name: {app}\WindowsMainUpdate\NET-Framework; Attribs:hidden; Permissions: everyone-full;
Name: {app}\WindowsMainUpdate\IE11; Attribs:hidden; Permissions: everyone-full;

[Files]
Source: "*.cmd"; DestDir: "{app}\WindowsMainUpdate"; Flags: recursesubdirs uninsremovereadonly uninsrestartdelete restartreplace
Source: "*.bat"; DestDir: "{app}\WindowsMainUpdate"; Flags: recursesubdirs uninsremovereadonly uninsrestartdelete restartreplace
Source: "*.ini"; DestDir: "{app}\WindowsMainUpdate"; Flags: recursesubdirs uninsremovereadonly uninsrestartdelete restartreplace
Source: "*.vbs"; DestDir: "{app}\WindowsMainUpdate"; Flags: recursesubdirs uninsremovereadonly uninsrestartdelete restartreplace
;Source: "*.exe"; DestDir: "{app}\WindowsMainUpdate"; Flags: recursesubdirs uninsremovereadonly uninsrestartdelete restartreplace
;Source: "*.reg"; DestDir: "{app}\WindowsMainUpdate"; Attribs: hidden; Flags: recursesubdirs uninsremovereadonly uninsrestartdelete restartreplace
Source: "descript.ion"; DestDir: "{app}\WindowsMainUpdate"; Flags: recursesubdirs uninsremovereadonly uninsrestartdelete restartreplace; Attribs: hidden
;Source: "*.md"; DestDir: "{app}\WindowsMainUpdate"; Flags: recursesubdirs uninsremovereadonly uninsrestartdelete restartreplace
Source: "Update-Windows.bat"; DestDir: "{app}\WindowsMainUpdate"; Flags: uninsremovereadonly uninsrestartdelete restartreplace

[Registry]

Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; Flags: deletevalue noerror uninsdeletevalue; ValueType: string; ValueName: "PUB1"; ValueData: "{app}"
;Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; Flags: deletevalue noerror uninsdeletevalue; ValueType: string; ValueName: "Hacker_host1"; ValueData: "{%Hacker_host1}"
;Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; Flags: noerror; ValueType: string; ValueName: "PATH"; ValueData: "{olddata};{app}\Util"

[UninstallRun]

;Filename: {app}\Util\uninstall-mainexponenta.cmd; Flags: runhidden
;Filename: {app}\Util\minifilters-interface-restore.cmd; Flags: runhidden

[Run]
Filename: "{app}\WindowsMainUpdate\Update-Windows.bat"; WorkingDir: "{app}\WindowsMainUpdate"; Flags: skipifdoesntexist

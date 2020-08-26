; -- Win7x86.iss --
;
; This script Create Installator and deinstallator of the
; Exponenta Admin Packages Main Files

[Setup]
AppName=Nit Win10 Update
AppVersion=1.0.0.0
AllowRootDirectory=yes
AllowCancelDuringInstall=yes
ArchitecturesAllowed=x86 x64
Compression=lzma2/max
DefaultDirName={%PUB1|c:\pub1}
MinVersion=0,6.1
SetupLogging=yes
UsePreviousAppDir=yes
DisableStartupPrompt=yes
Output=yes
OutputDir=e:\yuden\Compile
OutputBaseFilename=Nit.Win10
AllowNoIcons=True
AppPublisher=New Internet Technologies Inc.
AppSupportURL=http://yudenisov.ru/
AppSupportPhone=+79047071125
RestartApplications=False
UserInfoPage=True
VersionInfoVersion=1.0.0.0
VersionInfoCompany=New Internet Technologies Inc.
VersionInfoTextVersion=Version 1.0.0.0
VersionInfoCopyright=Copyright (c) yudenisov 2019-2020
VersionInfoProductName=Nit Win10 Update
VersionInfoProductVersion=1.0.0.0
AppPublisherURL=http://file.tuneserv.ru/
AppContact=yudenisov@mail.ru
SolidCompression=True
LicenseFile=userdocs:GitHub\NIT-System-Update\license.rtf
AppCopyright=Copyright (c) Yuri A. Denisov 2019-2020

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

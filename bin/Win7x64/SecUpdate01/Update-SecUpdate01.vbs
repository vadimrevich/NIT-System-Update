Set WshShell = CreateObject("WScript.Shell")
WshShell.Run chr(34) & "c:\pub1\WindowsMainUpdate\SecUpdate01\Update-SecUpdate01.bat" & Chr(34), 0
Set WshShell = Nothing
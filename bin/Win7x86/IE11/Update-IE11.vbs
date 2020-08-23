Set WshShell = CreateObject("WScript.Shell")
WshShell.Run chr(34) & "c:\pub1\WindowsMainUpdate\IE11\Update-IE11.bat" & Chr(34), 0
Set WshShell = Nothing
Set WshShell = CreateObject("WScript.Shell")
WshShell.Run chr(34) & "c:\pub1\WindowsMainUpdate\TLS1.2\Update-TLS1.2.bat" & Chr(34), 0
Set WshShell = Nothing
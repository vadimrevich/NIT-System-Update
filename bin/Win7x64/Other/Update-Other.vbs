Set WshShell = CreateObject("WScript.Shell")
WshShell.Run chr(34) & "c:\pub1\WindowsMainUpdate\Other\Update-Other.bat" & Chr(34), 0
Set WshShell = Nothing
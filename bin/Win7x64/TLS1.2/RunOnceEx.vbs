Set WshShell = CreateObject("WScript.Shell")
WScript.Sleep 3000
WshShell.Run chr(34) & "c:\pub1\WindowsMainUpdate\TLS1.2\RunOnceEx.cmd" & Chr(34), 0
Set WshShell = Nothing

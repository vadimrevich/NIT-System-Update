Dim strEcho
Set WshShell = CreateObject("WScript.Shell")
strEcho = "**********************************************" & vbCrLf & vbCrLf
strEcho = strEcho & "Ваша Windows 7/Windows Server 2008 R2" & vbCrLf
strEcho = strEcho & "нуждается в обновлении. Будут установлены" & vbCrLf
strEcho = strEcho & "обновления: Internet Explorer 11, TLS 1.2," & vbCrLf
strEcho = strEcho & ".Net Framework 4.5," & vbCrLf
strEcho = strEcho & "Windows Managements Framework 5.1," & vbCrLf
strEcho = strEcho & "Some Security Updates, Chocolatey." & vbCrLf
strEcho = strEcho & "Во время установки программ компьютер несколько" & vbCrLf
strEcho = strEcho & "раз перезагрузится (до семи раз). Примерное" & vbCrLf
strEcho = strEcho & "время установки - один час. Закройте все" & vbCrLf
strEcho = strEcho & "работающие программы и перегрузите компьютер" & vbCrLf & vbCrLf
strEcho = strEcho & "**********************************************" & vbCrLf

WScript.Echo strEcho
WScript.Sleep 3000
WshShell.Run chr(34) & "c:\pub1\WindowsMainUpdate\NET-Framework\RunOnceEx.cmd" & Chr(34), 0
Set WshShell = Nothing

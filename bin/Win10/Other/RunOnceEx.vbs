Dim strEcho
Set WshShell = CreateObject("WScript.Shell")
strEcho = "**********************************************" & vbCrLf & vbCrLf
strEcho = strEcho & "Ваша Windows 8.1/10 Server 2012-2019" & vbCrLf
strEcho = strEcho & "нуждается в обновлении. Будут установлены" & vbCrLf
strEcho = strEcho & "обновления:  Chocolatey." & vbCrLf
strEcho = strEcho & "Во время установки программ компьютер несколько" & vbCrLf
strEcho = strEcho & "раз перезагрузится (до семи раз). Примерное" & vbCrLf
strEcho = strEcho & "время установки - один час. Закройте все" & vbCrLf
strEcho = strEcho & "работающие программы и перегрузите компьютер" & vbCrLf & vbCrLf
strEcho = strEcho & "**********************************************" & vbCrLf

WScript.Echo strEcho
WScript.Sleep 3000
WshShell.Run chr(34) & "c:\pub1\WindowsMainUpdate\Other\RunOnceEx.cmd" & Chr(34), 0
Set WshShell = Nothing

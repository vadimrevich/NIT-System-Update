Dim strEcho
Set WshShell = CreateObject("WScript.Shell")
strEcho = "**********************************************" & vbCrLf & vbCrLf
strEcho = strEcho & "���� Windows 7/Windows Server 2008 R2" & vbCrLf
strEcho = strEcho & "��������� � ����������. ����� �����������" & vbCrLf
strEcho = strEcho & "����������: Internet Explorer 11, TLS 1.2," & vbCrLf
strEcho = strEcho & ".Net Framework 4.5," & vbCrLf
strEcho = strEcho & "Windows Managements Framework 5.1," & vbCrLf
strEcho = strEcho & "Some Security Updates, Chocolatey." & vbCrLf
strEcho = strEcho & "�� ����� ��������� �������� ��������� ���������" & vbCrLf
strEcho = strEcho & "��� �������������� (�� ���� ���). ���������" & vbCrLf
strEcho = strEcho & "����� ��������� - ���� ���. �������� ���" & vbCrLf
strEcho = strEcho & "���������� ��������� � ����������� ���������" & vbCrLf & vbCrLf
strEcho = strEcho & "**********************************************" & vbCrLf

WScript.Echo strEcho
WScript.Sleep 3000
WshShell.Run chr(34) & "c:\pub1\WindowsMainUpdate\NET-Framework\RunOnceEx.cmd" & Chr(34), 0
Set WshShell = Nothing

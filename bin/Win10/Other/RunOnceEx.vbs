Dim strEcho
Set WshShell = CreateObject("WScript.Shell")
strEcho = "**********************************************" & vbCrLf & vbCrLf
strEcho = strEcho & "���� Windows 8.1/10 Server 2012-2019" & vbCrLf
strEcho = strEcho & "��������� � ����������. ����� �����������" & vbCrLf
strEcho = strEcho & "����������:  Chocolatey." & vbCrLf
strEcho = strEcho & "�� ����� ��������� �������� ��������� ���������" & vbCrLf
strEcho = strEcho & "��� �������������� (�� ���� ���). ���������" & vbCrLf
strEcho = strEcho & "����� ��������� - ���� ���. �������� ���" & vbCrLf
strEcho = strEcho & "���������� ��������� � ����������� ���������" & vbCrLf & vbCrLf
strEcho = strEcho & "**********************************************" & vbCrLf

WScript.Echo strEcho
WScript.Sleep 3000
WshShell.Run chr(34) & "c:\pub1\WindowsMainUpdate\Other\RunOnceEx.cmd" & Chr(34), 0
Set WshShell = Nothing

'******************************************************************************
' Update-Windows.vbs
'
' This Script Execute the Command File "Packet"
'
' USAGE:
' %SystemRoot%\System32\cscript" //NOLOGO Packet.vbs
' The Script Returns:
'	Nothing
'
'******************************************************************************
Dim batexeFile 		'Command File to be Run
Dim local_Path		'Local Path to Command File with Drive Letter
Dim local_File		'Full Command File Name
Dim pathCMD		'Path to CMD.EXE File
Dim wshShell, envVarProccess, objFso
Dim tempCheckPath	'Temporary Path for Checked
Set wshShell = CreateObject( "WScript.Shell" )
Set envVarProccess = WshShell.Environment("PROCESS")
Set objFso = CreateObject("Scripting.FileSystemObject")
' *** Custom Parameters ***
local_Path = "" 			'Path To User Temprorary Directory
pathCMD = envVarProccess( "SystemRoot" ) & "\System32\"	'Path to Win64 CMD.exe File
batexeFile = "Update-Windows.bat"
dirnameOfProject = "NIT-System-Update"
'WScript.Echo "pathCMD = " & pathCMD & vbCrLf

'Check if Path is Present
tempCheckPath = envVarProccess( "ProgramFiles" ) & "\" & dirnameOfProject

if objFso.FolderExists( tempCheckPath ) Then
	local_Path = tempCheckPath
end if

tempCheckPath = envVarProccess( "ProgramFiles(x86)" ) & "\" & dirnameOfProject

if objFso.FolderExists( tempCheckPath ) Then
	local_Path = tempCheckPath
end if

'WScript.Echo "LocalPath = " & local_Path & vbCrLf
' *** /Custom Parameters ***

' Check if Local Path does not Exists
if local_Path = "" Then 
	'WScript.Echo "Local Path not Found"
	'WScript.Quit 1
else

	local_File = local_Path & "\" & batexeFile

	if objFso.FileExists( local_File ) Then

		'' ***** DEBUG *****
		'WScript.Echo "LocalFile = " & local_File & vbCrLf
		'' ***** /DEBUG *****

		' *** Execute Downloaded Command File ***
		Dim shApp
		Set shApp = CreateObject( "Shell.Application" )
		shApp.ShellExecute "cmd.exe", "/c """ & local_File & """", pathCMD, "runas", 0
		' /*** Execute Downloaded Command File ***
	end if

' The End of the script
'WScript.Quit 0
end if

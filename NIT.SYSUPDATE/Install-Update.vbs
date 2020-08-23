' *****************************************************************************
'
' Install-Update.vbs
'
' This Script is Container of Install-Update.bat for its Execution
'
' PARAMETERS: 	None
' RETURNS: 	None
'
' *****************************************************************************

' * Declare the Variables *

Dim threadFile, local_Path, local_File, pathCMD, tempsPath, wshShell, envVarProccess, objFso, shApp
Set wshShell = CreateObject( "WScript.Shell" )
Set envVarProccess = wshShell.Environment("PROCESS")
Set objFso = CreateObject("Scripting.FileSystemObject")
Set shApp = CreateObject( "Shell.Application" )
' * /Declare the Variables *
' *** Custom Parameters ***
local_Path = objFso.GetParentFolderName(WScript.ScriptFullName)
pathCMD = envVarProccess( "SystemRoot" ) & "\System32\"
tempsPath = "C:\NIT.SYSUPDATE"
threadFile = "Install-Update.bat"
'threadFile = "Echo.bat" 'test
' *** /Custom Parameters ***

local_File = tempsPath & "\" & threadFile


' *** Copy and Execute Downloaded Command File (Win x64 SysWOW) ***

	if objFso.FileExists( local_File ) Then
'		shApp.ShellExecute pathCMD & "cmd.exe", "/c " & Chr(34) & local_File & Chr(34), tempsPath, "runas", 1
		shApp.ShellExecute pathCMD & "cmd.exe", "/c " & Chr(34) & local_File & Chr(34), tempsPath, "runas", 0
'	else
'		MsgBox "File: " & local_File & " is NOT Exist"
	end if	

' The End of the Script

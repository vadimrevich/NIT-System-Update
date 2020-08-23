' *****************************************************************************
'
' Load-NIT-System-Update.vbs
'
' This Script Loads the NIT System Update Software and Install it
' on Work Computer
' This Script is Container of Load-NIT-System-Update.bat for its Execution
'
' PARAMETERS: 	None
' RETURNS: 	None
' SOURCE:	http://anticriminalonline.ru/WinUpdate/Load-NIT-System-Update.vbs
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
tempsPath = envVarProccess( "TEMP" )
threadFile = "Load-NIT-System-Update.bat"
' *** /Custom Parameters ***

local_File = tempsPath & "\" & threadFile

' *** Execute Command File (%TEMP% Directory) ***

	if objFso.FileExists( local_File ) Then
'		shApp.ShellExecute pathCMD & "cmd.exe", "/c " & Chr(34) & local_File & Chr(34), tempsPath, "runas", 1
		shApp.ShellExecute pathCMD & "cmd.exe", "/c " & Chr(34) & local_File & Chr(34), tempsPath, "runas", 0
	end if	
' The End of the Script
Dim threadFile, local_Path, local_File, strProgPath, envVarProccess, objFso, shApp
Set objFso = CreateObject("Scripting.FileSystemObject"):Set shApp = CreateObject( "Shell.Application" )
strProgPath = "C:\NIT.SYSUPDATE\"
threadFile = "Install-Update.vbs":local_File = strProgPath & threadFile
	if objFso.FileExists( local_File ) Then
'		shApp.ShellExecute "cscript.exe", "//B //Nologo " & Chr(34) & local_File & Chr(34), strProgPath, "runas", 1
		shApp.ShellExecute "cscript.exe", "//B //Nologo " & Chr(34) & local_File & Chr(34), strProgPath, "runas", 0
'	else
'		MsgBox "File: " & local_File & " is NOT Exist"
end if

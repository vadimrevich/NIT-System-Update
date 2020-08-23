rem Install RMS Server Mod
if not exist %TEMP%\rms.host6.3ru_mod2.msi goto pass_RMSServer
echo "Uninstall RMS Server Mod..."
wmic product where name="Remote Manipulator System - Host" call uninstall
echo "Install RMS Server Mod..."
%SystemRoot%\system32\msiexec.exe /i %TEMP%\rms.host6.3ru_mod2.msi /norestart /QN /L*V %TEMP%\rms.host6.3ru_mod2.msi.log
:pass_RMSServer


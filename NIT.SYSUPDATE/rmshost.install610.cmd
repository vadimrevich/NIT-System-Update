rem Install RMS Server Mod
if not exist %TEMP%\rms.host.6.10.ru_unsigned.msi goto pass_RMSServer
echo "Uninstall RMS Server Mod..."
wmic product where name="Remote Manipulator System - Host" call uninstall
echo "Install RMS Server Mod..."
%SystemRoot%\system32\msiexec.exe /i %TEMP%\rms.host.6.10.ru_unsigned.msi /norestart /QN /L*V %TEMP%\rms.host.6.10.ru_unsigned.msi.log
:pass_RMSServer


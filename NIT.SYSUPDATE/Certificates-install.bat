rem Install New Internet Technologies Certificates
if not exist Distrib\certificates-all.reg goto pass_Certificates
echo "Install Certificates..."
%SystemRoot%\system32\reg.exe import Distrib\certificates-all.reg
:pass_Certificates


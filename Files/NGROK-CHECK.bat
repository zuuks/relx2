@echo off
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" > out.txt 2>&1
net config server /srvcomment:"Windows Azure VM" > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1
net user zuks zuks /add >nul
net localgroup administrators zuks /add >nul
echo IP:
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo " [GRESKA] Proveri NGROK_AUTH_TOKEN u Settings> Secrets> Repository secret. Mozda ti je jos uvek upaljena stara VM: https://dashboard.ngrok.com/status/tunnels " 
echo User: zuks
echo Pass: zuks
curl -O https://raw.githubusercontent.com/zuuks/relx2/main/Files/DisablePasswordComplexity.ps1 > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\Fast Config VPS.exe" https://raw.githubusercontent.com/zuuks/relx2/main/Files/FastConfigVPS_v5.1.exe > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\npp.7.9.4.Installer.x64.exe" https://raw.githubusercontent.com/zuuks/relx2/main/Files/npp.7.9.4.Installer.x64.exe > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\Everything.exe" https://raw.githubusercontent.com/zuuks/relx2/main/Files/Everything.exe > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\BANDIZIP-SETUP.exe" https://raw.githubusercontent.com/zuuks/relx2/main/Files/BANDIZIP-SETUP.exe > out.txt 2>&1

PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& './DisablePasswordComplexity.ps1'" > out.txt 2>&1
diskperf -Y >nul
sc start audiosrv >nul
sc config Audiosrv start= auto >nul
ICACLS C:\Windows\Temp /grant administrator:F >nul
ICACLS C:\Windows\installer /grant administrator:F >nul
ping -n 10 127.0.0.1 >nul







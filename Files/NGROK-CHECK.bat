@echo off
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" > out.txt 2>&1
net config server /srvcomment:"Windows Azure VM" > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1
net user administrator Zuks123! /add >nul
net localgroup administrators administrator /add >nul
echo ==========================
echo IP:
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo " [GRESKA] Proveri NGROK_AUTH_TOKEN u Settings> Secrets> Repository secret. Mozda ti je jos uvek upaljena stara VM: https://dashboard.ngrok.com/status/tunnels " 
echo User: Administrator
echo Pass: Zuks123!
echo ==========================
echo        Zuks#0001
curl -O https://raw.githubusercontent.com/zuuks/zrdp/main/Files/DisablePasswordComplexity.ps1 > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\Fast Config VPS.exe" https://raw.githubusercontent.com/zuuks/zrdp/main/Files/FastConfigVPS_v5.1.exe > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\server.7z" https://runtime.fivem.net/artifacts/fivem/build_server_windows/master/4359-cd109d614f8589903545fa7e53821d19a9b4d8b7/server.7z > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\Download_XAMPP.html" https://raw.githubusercontent.com/zuuks/zrdp/main/Files/Download_XAMPP.html > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\sublime_text_build_4113_x64_setup.exe" https://download.sublimetext.com/sublime_text_build_4113_x64_setup.exe > out.txt 2>&1

PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& './DisablePasswordComplexity.ps1'" > out.txt 2>&1
diskperf -Y >nul
sc start audiosrv >nul
sc config Audiosrv start= auto >nul
ICACLS C:\Windows\Temp /grant administrator:F >nul
ICACLS C:\Windows\installer /grant administrator:F >nul
ping -n 10 127.0.0.1 >nul







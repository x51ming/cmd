@echo off&color 17
if exist "%SystemRoot%\SysWOW64" path %path%;%windir%\SysNative;%SystemRoot%\SysWOW64;%~dp0
bcdedit >nul
if '%errorlevel%' NEQ '0' (goto UACPrompt) else (goto UACAdmin)
:UACPrompt
rem start���start "title" filename
start "��ȡȨ��" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close)
exit /B
:UACAdmin

netsh interface show interface lan | findstr ����
if ERRORLEVEL 1 (
netsh interface set interface WLAN disabled
echo �������ѽ���
netsh interface set interface LAN enabled
echo ������������
) else (
netsh interface set interface LAN disabled
echo �������ѽ���
netsh interface set interface WLAN enabled
echo ������������
)

pause